require 'rails_helper'

RSpec.describe "the user artists dashboard", :vcr do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      visit user_artists_path(@user.id)

      within('#header') do
        expect(page).to have_content('My Artists')
      end

      within('#artists') do
        expect(page).to have_content('satan')
        expect(page).to have_content('medusa')
        expect(page).to have_content('xena')
      end
    end
  end
end
