class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_count
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_count(count)
    user.update('posts_count', count)
  end
end
