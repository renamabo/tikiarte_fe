# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Sessions' do
  before(:each) do
    @user = GoogleUser.new({ id: 1, attributes: { email: 'test@test.com' } })

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'sessions' do
    it 'allows user to logout of account' do
      visit account_management_index_path

      expect(page).to have_link('Logout')

      click_link('Logout')

      expect(current_path).to eq(root_path)
    end
  end
end
