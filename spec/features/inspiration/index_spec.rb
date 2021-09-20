require 'rails_helper'

RSpec.describe 'Inspiration Page' do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      visit inspiration_index_path

      within('#header') do
        expect(page).to have_content('Find Inspiration')
      end

      within('#picture') do
        expect(page).to have_link('Randomize my Picture!')
      end
    end
  end

  describe 'function' do
    it 'can return a random picture' do
      mock_response = "{\"data\":{\"id\":1,\"attributes\":{\"url\":\"/app/images/face.png\"}}}"

      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
      allow_any_instance_of(Faraday::Response).to receive(:body).and_return(mock_response)

      visit inspiration_index_path

      within('#picture') do
        click_link 'Randomize my Picture!'
        expect(page).to have_css("img[src*='/app/images/face.png']")
      end
    end
  end
end
