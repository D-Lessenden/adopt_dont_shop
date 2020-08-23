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
  describe 'I visit the pets show page' do
    it "then I see the pets image, name, description, approximate age, sex, adoption status" do
      @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
      @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
      visit "/pets/#{@pet1.id}"

      expect(page).to have_css("img[src*='#{"https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1"}']")
      expect(page).to have_content("#{@pet1.name}")
      expect(page).to have_content("#{@pet1.description}")
      expect(page).to have_content("#{@pet1.approximate_age}")
      expect(page).to have_content("#{@pet1.sex}")
      expect(page).to have_content("#{@pet1.adoption_status}")

    end
  end
end
