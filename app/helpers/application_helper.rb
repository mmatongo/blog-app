module ApplicationHelper
  def user_avatar(user)
    user.photo.present? ? user.photo : "https://i.pravatar.cc/150?u=#{user.name}"
  end
end
