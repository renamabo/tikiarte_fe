require 'rails_helper'

RSpec.describe "artist show page", :vcr do
  before(:each) do
    @user = GoogleUser.new( { id: 5, attributes: { email: 'test@test.com' } } )
    @artist = Artist.new('bob', 7)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      visit user_artist_path(@user.id, @artist.id)

      within('#header') do
        expect(page).to have_content(@artist.username)
      end

      within('#count') do
        expect(page).to have_content("Total Art Pieces: 2")
      end

      within('#private-gallery') do
        expect(page).to have_css("img[src*='https://tikiarte-dev.s3.us-east-2.amazonaws.com/uploads/06cc9da2-18e8-4439-84f1-87e8a18a8d1e?response-content-disposition=inline%3B%20filename%3D%2270700038_741384019621630_5958399291367674370_n_1574090453__rend_9_16.jpeg%22%3B%20filename%2A%3DUTF-8%27%2770700038_741384019621630_5958399291367674370_n_1574090453__rend_9_16.jpeg']")
        expect(page).to have_css("img[src*='https://tikiarte-dev.s3.us-east-2.amazonaws.com/uploads/97a6c369-1fdb-462d-8c35-438b2f81b59e?response-content-disposition=inline%3B%20filename%3D%22e03d5b812b2734826f76960eca5b5541.jpg%22%3B%20filename%2A%3DUTF-8%27%27e03d5b812b2734826f76960eca5b5541.jpg']")
      end
    end
  end

  describe 'link to upload page' do
    it 'can redirect to art_pieces upload page' do
      visit user_artist_path(@user.id, @artist.id)

      expect(page).to have_link("Upload an Art Piece")

      click_link "Upload an Art Piece"

      expect(current_path).to eq(new_user_artist_art_piece_path(@user.id, @artist.id))
      expect(page).to have_content("Upload an Art Piece")
      expect(page).to have_content("Name Your New Art Piece:")
      expect(page).to have_content("Describe Your Art Piece:")
      expect(page).to have_field(:art_piece_title)
      expect(page).to have_button("Create Art Piece")
    end
  end

end
