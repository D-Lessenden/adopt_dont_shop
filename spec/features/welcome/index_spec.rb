require 'rails_helper'

describe "As a user" do
  it "I can go to the shelter index page from the welcome page" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

  visit "/"
  click_on "Shelters"

  expect(current_path).to eq("/shelters")

  expect(page).to have_content(@shelter1.name)
  expect(page).to have_content(@shelter1.address)
  expect(page).to have_content(@shelter1.city)
  expect(page).to have_content(@shelter1.state)
  expect(page).to have_content(@shelter1.zip)
  end
end

describe "As a user" do
  it "I can go to the shelter index page from the welcome page" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")

  visit "/"
  click_on "Pets"

  expect(current_path).to eq("/pets")

  expect(page).to have_css("img[src*='#{"https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1"}']")
  expect(page).to have_content(@pet1.name)
  expect(page).to have_content(@pet1.approximate_age)
  expect(page).to have_content(@pet1.sex)
  expect(page).to have_content(@pet1.shelter.name)
  end
end
