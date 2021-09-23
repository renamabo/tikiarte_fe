require 'rails_helper'

RSpec.describe BackendFacade do
  it 'can return a new google user' do
    VCR.use_cassette('backend_user') do
      user_info = { google_id: 1, email: 'none@noemail.com', token: '100' }
      google_user = BackendFacade.user(user_info)
      expect(google_user).to be_a(GoogleUser)
      expect(google_user.id).to eq('6')
      expect(google_user.email).to eq('none@noemail.com')
    end
  end

  it 'sets current user by user ir' do
    VCR.use_cassette('current_user') do
      user_id = 5
      google_user = BackendFacade.current_user(5)
      expect(google_user).to be_a(GoogleUser)
      expect(google_user.email).to eq("jococopo@gmail.com")
    end
  end

  # it 'formats public images data' do
  #   VCR.use_cassette('public_images') do
  #     gallery = BackendFacade.public_images
  #     expect(gallery).to be_an(Image)
  #   end
  # end
end
