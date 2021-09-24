require 'rails_helper'

RSpec.describe "public gallery", :vcr do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'shows header' do
      visit public_gallery_index_path

      within('#header') do
        expect(page).to have_content('Public Gallery')
      end

      within('#images') do
        expect(page).to have_css("img[src*='https://tikiarte-dev.s3.us-east-2.amazonaws.com/uploads/fa383404-d62d-4e55-af14-e7c3ed61f5a5?response-content-disposition=inline%3B%20filename%3D%22sub-buzz-11577-1538631066-1.jpeg%22%3B%20filename%2A%3DUTF-8%27%27sub-buzz-11577-1538631066-1.jpeg']")
        expect(page).to have_css("img[src*='https://tikiarte-dev.s3.us-east-2.amazonaws.com/uploads/673e4c60-9d31-4cab-9393-2ec6f98df200?response-content-disposition=inline%3B%20filename%3D%22988fb9e5bb6aaf57f9825a677549343c.jpeg%22%3B%20filename%2A%3DUTF-8%27%27988fb9e5bb6aaf57f9825a677549343c.jpeg']")
      end
    end
  end
end
