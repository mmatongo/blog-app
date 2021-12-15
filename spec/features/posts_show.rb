require 'rails_helper'

RSpec.feature 'Posts page', type: :feature do
    login_user

    background do
      @post = Post.new(
        title: 'Test post',
        text: 'Test post text',
        user_id: @user.id
      )
      visit user_posts_path(user_id: @user.id, id: @post.id)
    end

    scenario 'can see author name' do
      expect(page).to have_content @post.user.name
      puts "The Author Name #{@post.user.name}"
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
