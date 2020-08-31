require 'rails_helper'
RSpec.describe 'Favorites index page' do
#   describe 'As a visitor' do
#     it "I see favorited pets name and image" do
#       @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
#       @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#       @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#       visit "/pets/#{@pet1.id}"
#       click_button("Add to Favorites", match: :first)
#       visit '/favorites'
#
#
#       expect(page).to have_content(@pet1.name)
#       expect(page).to have_no_content(@pet2.name)
#
#
#     end
#   end
#
#   it "I ONLY see favorited pets name and image" do
#     @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
#     @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#     @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#     visit "/pets/#{@pet1.id}"
#     click_button("Add to Favorites", match: :first)
#     visit '/favorites'
#
#
#     expect(page).to have_content(@pet1.name)
#     expect(page).to have_no_content(@pet2.name)
#   end
#
#   it "has a link on the navbar to go to Favorites" do
#     visit '/pets'
#     # within('.nav-bar') do
#     #   click_link "Favorites"
#     # end
#     # expect(current_path).to eq("/favorites")
# end
#
#   # it "returns the message 'You have no favorited pets' when no pets on index page" do
#   #   visit '/favorites'
#   #   expect(page).to have_content('You have no favorited pets')
#   # end
#
#   it "can delete pets on the favorite page " do
#
#     @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
#     @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#     @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#     visit "/pets/#{@pet1.id}"
#     click_button("Add to Favorites", match: :first)
#     visit "/pets/#{@pet2.id}"
#     click_button("Add to Favorites", match: :first)
#
#
#     visit '/favorites'
#     click_button("Remove from Favorites", match: :first)
#
#
#     expect(page).to have_no_content(@pet1.name)
#     expect(page).to have_content(@pet2.name)
#
#
#
#
#
#   end
#
#
#
#   it "can delete all pets on the favorite page at once" do
#     @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
#     @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#     @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#     visit "/pets/#{@pet1.id}"
#     click_button("Add to Favorites", match: :first)
#     visit "/pets/#{@pet2.id}"
#     click_button("Add to Favorites", match: :first)
#     visit '/favorites'
#     expect(page).to have_content(@pet1.name)
#     expect(page).to have_content(@pet2.name)
#
#     click_button 'Remove All From Favorites'
#     expect(page).to have_no_content(@pet1.name)
#     expect(page).to have_no_content(@pet2.name)
#     visit '/favorites'
#
#     expect(page).to have_content('You have no favorited pets')
#
#   end
#
#   describe "it has a link for adopting my favorited pets" do
#     it "When I click that link I'm taken to a new application form" do
#       @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
#       @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#       visit "/pets/#{@pet1.id}"
#       click_button("Add to Favorites", match: :first)
#       visit '/favorites'
#
#       click_link "New Application"
#
#       expect(current_path).to eq("/apps/new")
#     end
#   end

  it "has a secion of pets that have an application" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    visit "/pets/#{@pet1.id}"
    click_button("Add to Favorites", match: :first)
    visit "/pets/#{@pet2.id}"
    click_button("Add to Favorites", match: :first)

    visit '/apps/new'
    check "snowball"
    check "fireball"
    fill_in 'name', with: "Test"
    fill_in 'address', with: "Test"
    fill_in 'city', with: "Test"
    fill_in 'state', with: "Test"
    fill_in 'zip', with: "Test"
    fill_in 'phone_number', with: "Test"
    fill_in 'description', with: "Test"

    click_button "Submit Application"
    # @app1 = App.create!(name: "Testy", address: "1234", city: "City", state: "CO", zip: "12345", phone_number: "1234567", description: "description", pet_id: @pet1.id)
    # @app2 = App.create!(name: "Testy2", address: "1234", city: "City", state: "CO", zip: "12345", phone_number: "1234567", description: "description", pet_id: @pet2.id)
    #
    #
    # ApplicationPet.create(app_id: @app1.id, pet_id: @pet1.id)
    # ApplicationPet.create(app_id: @app2.id, pet_id: @pet2.id)

    visit "/favorites"
    expect(page).to have_content("Pets that have an application")
    save_and_open_page

    #expect(page).to have_content(@pet)

  end



end
