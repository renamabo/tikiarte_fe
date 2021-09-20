require 'rails_helper'

RSpec.describe "artist show page" do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )
    @artist = Artist.new( { id: 1, attributes: { username: 'Tiki14' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      VCR.use_cassette('artist_show') do
        visit user_artist_path(@user.id, @artist.id)

        within('#header') do
          expect(page).to have_content(@artist.username)
        end
      end
    end
  end
end
