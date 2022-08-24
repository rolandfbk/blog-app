require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include "Here is a list of users" on the screen' do
      expect(response.body).to include('DreamArt Blog')
    end
  end

  describe 'GET #show' do
    user = User.create(name: 'Grabrielle', photo: 'mybaby.png', bio: 'A beautiful baby', post_counter: 0)
    before(:each) { get user_path id: user.id }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should include "Bio:" on the screen' do
      expect(response.body).to include('Bio:')
    end
  end
end
