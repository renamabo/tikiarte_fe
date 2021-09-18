require 'rails_helper'

RSpec.describe "create user artist" do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'functionality' do
    it 'new artist' do
      visit user_artists_path(@user.id)

      click_button 'Add Artist'

      expect(current_path).to eq(new_user_artist_path(@user.id))

      within('#header') do
        expect(page).to have_content('Add a New Artist')
      end

      within('#form') do
        fill_in 'username', with: 'artist_1'
        fill_in 'password', with: 'password'
        fill_in 'password_confirmation', with: 'password'

        click_button 'Add Artist'
      end

      expect(current_path).to eq(user_artists_path(@user.id))
    end
  end
end
