class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_posts_counter
    post.increment!(:comments_counter)
  end

  def as_json(options={})
    { :id => self.id, :text => self.text, :post_id => self.post_id }
  end
end
