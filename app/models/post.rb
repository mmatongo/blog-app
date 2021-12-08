class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments(limit = 5)
    comments.last(limit)
  end

  def liked?(user_id)
    likes.where(user_id: user_id).exists?
  end

  def update_count(count)
    user.update('posts_counter', count)
  end
end
