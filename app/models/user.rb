class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
