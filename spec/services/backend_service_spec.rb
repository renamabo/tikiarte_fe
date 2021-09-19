require 'rails_helper'

RSpec.describe BackendService do
  it 'can send user credentials to post and return user info' do
    VCR.use_cassette('backend_user') do
      user_info = { google_id: 1, email: 'none@noemail.com', token: '100' }
      current_user = BackendService.create_or_find_user(user_info)
      expect(current_user).to be_a(Hash)
      expect(current_user[:data]).to have_key(:id)
      expect(current_user[:data]).to have_key(:type)
      expect(current_user[:data]).to have_key(:attributes)
      expect(current_user[:data][:attributes]).to have_key(:email)
      expect(current_user[:data][:attributes]).to have_key(:token)
      expect(current_user[:data][:attributes]).to have_key(:google_id)
    end
  end
  it 'can return current user' do
    VCR.use_cassette('backend_find_user') do
      current_user = BackendService.find_user_by_id(3)
      expect(current_user).to be_a(Hash)
      expect(current_user[:data]).to have_key(:id)
      expect(current_user[:data]).to have_key(:type)
      expect(current_user[:data]).to have_key(:attributes)
      expect(current_user[:data][:attributes]).to have_key(:email)
      expect(current_user[:data][:attributes]).to have_key(:token)
      expect(current_user[:data][:attributes]).to have_key(:google_id)
    end
  end
end
