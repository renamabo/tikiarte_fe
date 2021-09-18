require 'rails_helper'

RSpec.describe "create user artist" do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'functionality' do
    it 'new artist' do
      visit user_artists_path(@user.id)
    end
  end
end
