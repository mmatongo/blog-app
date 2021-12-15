require 'rails_helper'

RSpec.feature 'user index', type: :feature do
  login_user
  background do
    @test_user = FactoryBot.create(:user, name: 'John Doe')
    visit root_path
  end

  scenario 'can see usernames' do
    expect(page).to have_content @test_user.name
  end

  scenario 'can see profile pictures' do
    expect(find('.user-avatar') { |img| img[:src] == user_avatar(@test_user) }).to be_present
  end
  
  scenario 'can see the number of posts' do
    expect(page).to have_content "#{@test_user.posts_counter} Posts"
  end
  
  scenario 'redirects to the user profile page' do
    click_link @test_user.id.to_s
    expect(current_path).to eq user_path(@test_user.id)
  end
end