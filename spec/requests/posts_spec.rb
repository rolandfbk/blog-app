require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/2/posts' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include "Here is a list of posts for a given user" on the screen' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/2/posts/2' } # get(:show, params: { id: 2 })
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should include "Here the details of a post: Comments and Likes" on the screen' do
      expect(response.body).to include('Here the details of a post: Comments and Likes')
    end
  end
end
