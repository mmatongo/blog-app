require 'rails_helper'

RSpec.feature 'Posts page', type: :feature do
  include ControllerMacros
  background do
    login_user
    @post = FactoryBot.create(:post, comments_counter: 3, user: @user)
    visit user_post_path(user_id: @user.id, id: @post.id)
  end

  scenario 'can see author name' do
    expect(page).to have_content('John Smith')
  end

  scenario 'can see post title' do
    expect(page).to have_content @post.title
  end

  scenario 'can see the number of comments' do
    expect(page).to have_content '3 Comments'
  end

  scenario 'can see the number of likes' do
    expect(find_button("#{@post.likes_counter} Likes")).to be_visible
  end

  scenario 'can see the post text' do
    expect(page).to have_content @post.text
  end
end
