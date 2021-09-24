# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Account Management Page', :vcr do
  before(:each) do
    @user = GoogleUser.new({ id: 1, attributes: { email: 'test@test.com' } })

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      visit account_management_index_path

      within('#header') do
        expect(page).to have_content('Account Management')
      end

      within('#artists') do
        expect(page).to have_content('artist_1')
        expect(page).to have_content('tiki')
      end
    end
  end

  describe 'functionality' do
    it "can edit an artist's information" do
      visit account_management_index_path

      within('#artist-5') do
        expect(page).to have_button('Edit')
        click_button('Edit')
        expect(current_path).to eq(edit_user_artist_path(1, 5))
      end

      expect(page).to have_content('Edit artist_1')

      within('#form') do
        fill_in 'username', with: 'happy_little_trees'
        fill_in 'password', with: 'bobpaints'
        fill_in 'password_confirmation', with: 'bobpaints'

        click_button 'Edit Artist'
      end

      expect(current_path).to eq(account_management_index_path)

      within('#artists') do
        expect(page).to have_content('happy_little_trees')
        expect(page).to_not have_content('artist_1')
      end
    end

    it 'can delete an artist' do
      visit account_management_index_path

      within('#artist-5') do
        expect(page).to have_button('Delete')
        click_button('Delete')
        expect(current_path).to eq(account_management_index_path)
      end

      expect(page).to_not have_content('happy_little_trees')
    end
  end
end
