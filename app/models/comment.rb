class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comments_counter

  def update_count(count)
    post.update(comments_counter: count)
  end
end
