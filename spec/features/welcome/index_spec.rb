require 'rails_helper'
RSpec.describe 'Welcome page' do
  it 'has the app name and welcome message' do
    visit root_path
    expect(page).to have_content('Tikiarté')
    expect(page).to have_content('Welcome to Tikiarté!')
  end
  xit 'can sign in with a google account' do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      "provider" => "google_oauth2",
      "uid" => "100000000000000000000",
      "info" => {
        "email" => "john@example.com"
      },
      "credentials" => {
        "token" => "TOKEN",
        :refresh_token => "refresh token"
      }
    })
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    visit root_path
    expect(page).to have_button("Sign in with Google")
    click_button "Sign in with Google"

    expect(current_path).to eq(dashboard_path)
  end
  xit 'returns an authentication error when credentials are not valid' do
    visit root_path
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

    click_link "Sign in"
    expect(page).to have_content('Authentication failed.')
  end
end
