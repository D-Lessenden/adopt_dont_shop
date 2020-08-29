require 'rails_helper'

RSpec.describe 'New application page' do
  it "has all favorited pets" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    visit "/pets/#{@pet1.id}"
    click_button("Add to Favorites", match: :first)
    visit "/pets/#{@pet2.id}"
    click_button("Add to Favorites", match: :first)

    visit '/apps/new'

    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet2.name)

    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
  end

  it "has a confirmation after submitting" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    visit "/pets/#{@pet1.id}"
    click_button("Add to Favorites", match: :first)
    visit "/pets/#{@pet2.id}"
    click_button("Add to Favorites", match: :first)

    visit '/apps/new'

    fill_in 'name', with: "Test"
    fill_in 'address', with: "Test"
    fill_in 'city', with: "Test"
    fill_in 'state', with: "Test"
    fill_in 'zip', with: "Test"
    fill_in 'phone_number', with: "Test"
    fill_in 'description', with: "Test"

    click_button "Submit Application"
    binding.pry


    expect(page).to have_content("Your application has been submitted")



  end

  it "has a warning if not every field is filled in" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    visit "/pets/#{@pet1.id}"
    click_button("Add to Favorites", match: :first)
    visit "/pets/#{@pet2.id}"
    click_button("Add to Favorites", match: :first)

    visit '/apps/new'

    fill_in 'name', with: "Test"
    fill_in 'city', with: "Test"
    fill_in 'state', with: "Test"
    fill_in 'zip', with: "Test"
    fill_in 'phone_number', with: "Test"
    fill_in 'description', with: "Test"
    click_button "Submit Application"

    expect(page).to have_content("All fields are required")
  end

  it "redircts back to the favorites page" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    visit "/pets/#{@pet1.id}"
    click_button("Add to Favorites", match: :first)
    visit "/pets/#{@pet2.id}"
    click_button("Add to Favorites", match: :first)

    visit '/apps/new'

    fill_in 'name', with: "Test"
    fill_in 'address', with: "Test"
    fill_in 'city', with: "Test"
    fill_in 'state', with: "Test"
    fill_in 'zip', with: "Test"
    fill_in 'phone_number', with: "Test"
    fill_in 'description', with: "Test"

    click_button "Submit Application"

    expect(current_path).to eq("/favorites")
  end
#add in model testing.
#add column for pet.id in the app table
end
