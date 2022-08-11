require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Grabrielle', photo: 'mybaby.png', bio: 'A beautiful baby', post_counter: 0)
  user.save
  post = Post.new(user_id: user, title: 'Hello', text: 'This is my first post')
  post.save

  user.likes.create(post_id: post, user_id: user)

  it 'When user like a post, it should return a total number of 1 like for that post' do
    expect(user.likes.length).to eq 1
  end
end
