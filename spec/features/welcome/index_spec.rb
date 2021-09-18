require 'rails_helper'
RSpec.describe 'Welcome page' do
  it 'has the app name and welcome message' do
    visit root_path
    expect(page).to have_content('Tikiarté')
    expect(page).to have_content('Welcome to Tikiarté!')
  end
  it 'can sign in with a google account' do
    visit root_path

    OmniAuth.config.test_mode = true
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
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    expect(page).to have_button("Sign in with Google")
    click_button "Sign in with Google"

    expect(current_path).to eq('/user/4')
  end
  it 'returns an authentication error when credentials are not valid' do
    visit root_path

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    click_button "Sign in with Google"
    expect(page).to have_content('Authentication failed.')
  end
end
