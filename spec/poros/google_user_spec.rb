require 'rails_helper'
describe GoogleUser do
  it 'can create a new google user with attributes' do
    user_hash = {:id=>"3", :type=>"director", :attributes=>{:email=>"none@noemail.com", :token=>"100", :google_id=>"1"}}
    user_object = GoogleUser.new(user_hash)
    expect(user_object).to be_a(GoogleUser)
    expect(user_object.id).to eq('3')
    expect(user_object.email).to eq('none@noemail.com')
  end
end
