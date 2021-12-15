require 'rails_helper'

RSpec.feature 'Posts have comments', type: :feature do
  login_user
  background do
    @post = FactoryBot.create(:post, :post_with_comments, user: @user)
    visit user_post_path(@user.id, @post.id)
  end

  scenario 'comments are displayed' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end

  scenario 'user is displayed' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.user.name
    end
  end
end