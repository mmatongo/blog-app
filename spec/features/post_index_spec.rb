require 'rails_helper'

RSpec.feature 'Posts are indexed', type: :feature do
  include ControllerMacros
  background do
    login_user
    @post = Post.create(title: 'Title 1', text: 'Text 1', user_id: @user.id)
    @comment = Comment.create(text: 'BlaBlaBla', user_id: @user.id, post_id: @post.id)
    visit user_posts_path(@user.id)
  end

  scenario 'can see username' do
    expect(page).to have_content @user.name
  end

  scenario 'can see first post title' do
    expect(page).to have_content(@user.posts[0].title)
  end

  scenario 'can see the profile picture' do
    expect(page).to have_selector('img[alt="profile picture"]')
  end

  scenario 'can see how many likes the post has' do
    expect(page).to have_content("Likes: #{@user.posts[0].likes_counter}")
  end

  scenario 'can see how the first comment is' do
    @user.posts.first.recent_comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
