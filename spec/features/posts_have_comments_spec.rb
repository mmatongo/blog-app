require 'rails_helper'

RSpec.feature 'Posts have comments', type: :feature do
  include ControllerMacros
  background do
    login_user
    @post = Post.create(title: 'Title 1', text: 'Text 1', user_id: @user.id)
    @comment = Comment.create(text: 'BlaBlaBla', user_id: @user.id, post_id: @post.id)
    visit user_post_path(@user.id, @post.id)
  end

  scenario 'comments are displayed' do
    @post.comments.each do |_comment|
      expect(page).to have_content(@comment.text)
    end
  end

  scenario 'user is displayed' do
    @post.comments.each do |_comment|
      expect(page).to have_content(@user.name)
    end
  end
end
