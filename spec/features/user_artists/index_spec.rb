require 'rails_helper'

RSpec.describe "the user artists dashboard" do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      VCR.use_cassette('artist_index') do
        visit user_artists_path(@user.id)

        within('#header') do
          expect(page).to have_content('My Artists')
        end

        within('#artists') do
          expect(page).to have_content('tiki')
          expect(page).to have_button("tiki's Portfolio Page")
          expect(page).to have_button('Add Artist')

          click_button("tiki's Portfolio Page")

          expect(current_path).to eq(user_artist_path(@user.id, 1))
        end
      end
    end
  end
end
