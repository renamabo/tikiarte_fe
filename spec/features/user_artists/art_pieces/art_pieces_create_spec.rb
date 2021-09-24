# frozen_string_literal: true

require 'rails_helper'

describe 'art piece upload page' do
  before(:each) do
    @user = GoogleUser.new({ id: 1, attributes: { email: 'test@test.com' } })
    @artist = Artist.new('Tiki', 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  # As a user, when I click the link to upload an image, I am directed to the image upload page where I can drag an image file or click to upload an image file, add tags and a name to the image, click upload to add image.
  # Route to upload (create) page
  # Add options to upload image (file drag and drop and/or file directory upload)
  # Add Upload or save button
  # Redirect to artist show page after upload complete
  xit 'can upload an image and redirect to artist show page once complete' do
    visit new_user_artist_art_piece_path(@user.id, @artist.id)

    expect(page).to have_content('Upload an Art Piece')
    expect(page).to have_content('Name Your New Art Piece:')
    expect(page).to have_content('Describe Your Art Piece:')
    expect(page).to have_field(:art_piece_title)
    expect(page).to have_button('Create Art Piece')

    click_button 'Create Art Piece'

    expect(current_path).to eq(user_artist_path(@user.id, @artist.id))
  end
end
