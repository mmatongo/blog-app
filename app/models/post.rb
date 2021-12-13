class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250, too_long: '%<count>s characters is the maximum allowed' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, counter_cache: :likes_counter
  has_many :users, through: :likes, counter_cache: :likes_counter

  def recent_comments(limit = 5)
    comments.last(limit)
  end

  def liked?(user_id)
    likes.where(user_id: user_id).exists?
  end

  def update_count(count)
    user.update(posts_counter: count)
  end
end
