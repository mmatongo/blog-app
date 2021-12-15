require 'rails_helper'

RSpec.feature 'Posts are indexed', type: :feature do
  background do
    @user = FactoryBot.create(:user_with_posts)
    sign_in @user
    visit user_posts_path(@user.id)
  end

  scenario 'can see username' do
    expect(page).to have_content @user.name
  end

  scenario 'can see first post title' do
    expect(page).to have_content @user.posts[0].title
  end

  scenario 'can see the profile picture' do
    expect(find('.user-avatar') { |img| img[:src] == user_avatar(@user) }).to be_present
  end

  scenario 'can see post body' do
    expect(page).to have_content @user.posts.first.text.truncate(100)
  end

  scenario 'can see how many likes the post has' do
   expect(page).to have_content "#{@user.posts[0].likes_counter} Like"
  end

  scenario 'can see how the first comment is' do
    @user.posts.first.recent_comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
