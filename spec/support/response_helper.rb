module ResponseHelper
  def response_json
    JSON.parse(response.body) rescue {}
  end
end

# spec/spec_helper.rb

require_relative 'support/response_helper'
RSpec.configure do |config|
  # ...
  config.include ResponseHelper
  # ...
end

# spec/controllers/signup_controller_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do
    let(:user_params) { { email: 'test@email.com', password: 'password', username: "Ami007" } }

    it 'returns http success' do
      post :create, params: user_params
      expect(response).to be_successful
      # expect(response_json.keys).to eq ['csrf']
      # expect(response.cookies[JWTSessions.access_cookie]).to be_present
    end

    it 'creates a new user' do
      expect do
        post :create, params: user_params
      end.to change(User, :count).by(1)
    end
  end
end
