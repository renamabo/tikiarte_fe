# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome page' do
  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe 'display' do
    it 'has the app name and welcome message' do
      visit root_path
      within('#header') do
        expect(page).to have_content('Tikiarté')
      end
      within('#welcome-message') do
        expect(page).to have_content('Welcome to Tikiarté!')
      end
    end
  end

  describe 'login' do
    it 'can sign in with a google account' do
      visit root_path

      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                           'provider' => 'google_oauth2',
                                                                           'uid' => '100000000000000000000',
                                                                           'info' => {
                                                                             'email' => 'john@example.com'
                                                                           },
                                                                           'credentials' => {
                                                                             'token' => 'TOKEN',
                                                                             :refresh_token => 'refresh token'
                                                                           }
                                                                         })
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      within('#button') do
        expect(page).to have_button('Sign in with Google')
        click_button 'Sign in with Google'
      end
      expect(current_path).to eq('/user/2/artists')
    end

    it 'returns an authentication error when credentials are not valid' do
      visit root_path

      OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      click_button 'Sign in with Google'
      expect(page).to have_content('Oops, something went wrong!')
    end
  end
end
