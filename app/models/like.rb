class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter
  validates :user_id, uniqueness: { scope: :post_id }

  def update_count(count)
    post.update(likes_counter: count)
  end
end
