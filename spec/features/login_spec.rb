require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  # background { visit new_user_session_path }

  scenario 'login form is displayed' do
    visit new_user_session_path 
    expect(page).to have_field?('user_email')
    expect(page).to have_field?('user_password')
    expect(page).to have_button?('Log in')
  end

  context 'submit' do
    scenario 'without email and password' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'with invalid email and password' do
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    # given(:other_user) { FactoryBot.create(:user) }
    # scenario 'with valid email and password' do
    #   within 'form' do
    #     fill_in 'user_email', with: other_user.email
    #     fill_in 'user_password', with: other_user.password
    #   end
    #   click_button 'Log in'
    #   expect(page).to have_content 'Signed in successfully.'
    # end
  end
end