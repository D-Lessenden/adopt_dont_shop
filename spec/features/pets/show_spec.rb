# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status

require 'rails_helper'

RSpec.describe 'As a visitor' do
  # describe 'I visit the pets show page' do
  #   it "then I see the pets image, name, description, approximate age, sex, adoption status" do
  #     @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
  #     @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
  #     visit "/pets/#{@pet1.id}"
  #
  #     expect(page).to have_css("img[src*='#{"https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1"}']")
  #     expect(page).to have_content("#{@pet1.name}")
  #     expect(page).to have_content("#{@pet1.description}")
  #     expect(page).to have_content("#{@pet1.approximate_age}")
  #     expect(page).to have_content("#{@pet1.sex}")
  #     expect(page).to have_content("#{@pet1.adoption_status}")
  #   end
  # end

  describe 'As a visitor' do
    describe 'I see a button When I click the button or link' do
      describe "I'm taken back to that pet's show page" do
        it "shows a flash message the pet has been added to favorites" do
          @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

          @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

          visit "/pets/#{@pet1.id}"
          click_button("Add to Favorites", match: :first)
          save_and_open_page
          expect(page).to have_content("Added to Favorites")
        end
      end
    end
  end

#   describe "As a user" do
#     it "I can go to the shelter's show page from pet show page" do
#       @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
#       @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
#
#     visit "/pets/#{@pet1.id}"
#
#     click_on "Go to Shelters"
#
#     expect(current_path).to eq("/shelters")
#     save_and_open_page
#     expect(page).to have_content(@shelter1.name)
#     expect(page).to have_content(@shelter1.address)
#     expect(page).to have_content(@shelter1.city)
#     expect(page).to have_content(@shelter1.state)
#     expect(page).to have_content(@shelter1.zip)
#   end
# end
end
