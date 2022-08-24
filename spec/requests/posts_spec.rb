require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user_first = User.create(name: 'Grabrielle', photo: 'mybaby.png', bio: 'A cute baby', post_counter: 0)

    @post_first = @user_first.posts.create(title: 'Love must lead', text: 'This is my first post', comments_counter: 0,
                                           likes_counter: 0)
  end
  describe 'GET #index' do
    before(:example) { get user_posts_path(@user_first) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include "Pagination' do
      expect(response.body).to include('Pagination')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(@user_first, @post_first) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should include post body on the screen' do
      expect(response.body).to include('This is my first post')
    end
  end
end
