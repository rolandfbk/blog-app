class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_posts_counter
    post.increment!(:comments_counter)
  end

  def as_json(_options = {})
    { id: id, text: text, post_id: post_id }
  end
end
