require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Grabrielle', photo: 'mybaby.png', bio: 'A beautiful baby', post_counter: 0)
  user.save
  post = Post.new(user_id: user, title: 'Hello', text: 'This is my first post')
  post.save

  user.comments.create(post_id: post, text: 'Hi Tom!')

  it 'When user add a comment on a post, it should return a total number of 1 comment for that post' do
    expect(user.comments.length).to eq 1
  end
end
