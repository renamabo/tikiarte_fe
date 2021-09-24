# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Inspiration Page', :vcr do
  before(:each) do
    @user = GoogleUser.new({ id: 1, attributes: { email: 'test@test.com' } })

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
      visit inspiration_index_path

      within('#picture') do
        click_link 'Randomize my Picture!'
        expect(page).to have_css("img[src*='https://i.picsum.photos/id/953/500/600.jpg?hmac=usnLsjAjLDy4r2YvpPQUPYIWCAs7eEuXQ1t9fsSd96Y']")
      end
    end
  end
end
