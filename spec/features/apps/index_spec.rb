require 'rails_helper'

RSpec.describe 'ApplicationPets index page' do
  it "has a link from the pets show page" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    visit "/pets/#{@pet1.id}"
    click_on 'Applications'
    expect(current_path).to eq("/apps")
  end

  
end
