require 'rails_helper'
describe BackendFacade do
  it 'can return a new google user' do
    VCR.use_cassette('backend_user') do
      user_info = { google_id: 1, email: 'none@noemail.com', token: '100' }
      google_user = BackendFacade.user(user_info)
      expect(google_user).to be_a(GoogleUser)
      expect(google_user.id).to eq('3')
      expect(google_user.email).to eq('none@noemail.com')
    end
  end
end
