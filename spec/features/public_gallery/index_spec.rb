require 'rails_helper'

RSpec.describe "public gallery" do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      mock_response = "{\"data\":[{\"id\":1,\"attributes\":{\"status\":\"public\",\"url\":\"/app/images/face.png\",\"artist_id\":1}},{\"id\":2,\"attributes\":{\"status\":\"public\",\"url\":\"/app/images/Reggie.JPG\",\"artist_id\":2}},{\"id\":3,\"attributes\":{\"status\":\"public\",\"url\":\"/app/images/turlte.jpg\",\"artist_id\":3}}]}"

      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
      allow_any_instance_of(Faraday::Response).to receive(:body).and_return(mock_response)

      visit public_gallery_index_path

      within('#header') do
        expect(page).to have_content('Public Gallery')
      end

      within('#images') do
        expect(page).to have_css("img[src*='/app/images/face.png']")
        expect(page).to have_css("img[src*='/app/images/Reggie.JPG']")
        expect(page).to have_css("img[src*='/app/images/turlte.jpg']")
      end
    end
  end
end
