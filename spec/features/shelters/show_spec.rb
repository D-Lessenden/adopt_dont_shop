# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip
require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the shelter show page' do
    it "then I see the shelters name, address, city, state, zip" do

    @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_content(@shelter1.name)
      expect(page).to have_content("#{@shelter1.address}")
      expect(page).to have_content("#{@shelter1.city}")
      expect(page).to have_content("#{@shelter1.state}")
      expect(page).to have_content("#{@shelter1.zip}")
    end
  end
end
