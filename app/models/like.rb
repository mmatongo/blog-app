class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likes_count

  def update_count(count)
    post.update(likes_count: count)
  end
end
