class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comments_count

  def update_count(count)
    post.uodate('comments_count', count)
  end
end
