class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter

  def update_count(count)
    post.update(likes_counter: count)
  end
end
