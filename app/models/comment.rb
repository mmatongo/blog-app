class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :comments_count

  def update_count(count)
    post.uodate('comments_count', count)
  end
end
