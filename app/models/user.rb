class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_make :likes, dependent: :destroy

  def recent_posts
    posts.last(3)
  end
end
