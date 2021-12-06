class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count

  def update_count(count)
    post.update(likes_count: count)
  end
end
