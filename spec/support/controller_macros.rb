module ControllerMacros
  def login_admin
    before(:each) do
      @admin = FactoryBot.create :admin
      sign_in @admin
    end
  end

  def login_user
    @user = User.create(
      name: 'John Smith',
      email: 'correct@email.com',
      password: 'correctpassword',
      confirmed_at: Time.now
    )
    visit user_session_path
    fill_in 'Email', with: 'correct@email.com'
    fill_in 'Password', with: 'correctpassword'
    click_button 'Log in'
  end

  def user_avatar(user)
    user.photo.present? ? user.photo : "https://i.pravatar.cc/150?u=#{user.name}"
  end
end
