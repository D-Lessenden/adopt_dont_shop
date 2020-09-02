# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the shelter pets index page' do
    it "then I see the pet image, name, approximate_age, and sex" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
      visit "/shelters/#{@shelter1.id}/pets"


      expect(page).to have_css("img[src*='#{"https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1"}']")
      expect(page).to have_content("#{@pet1.name}")
      expect(page).to have_content("#{@pet1.approximate_age}")
      expect(page).to have_content("#{@pet1.sex}")
    end
  end
end
