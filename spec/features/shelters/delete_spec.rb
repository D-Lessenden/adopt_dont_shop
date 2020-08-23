# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page
#where I no longer see this shelter
require 'rails_helper'

RSpec.describe 'Delete Shelter' do
  before :each do
      @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
      @shelter2 = Shelter.create(name: "Shelter2", address: "address", city: "city", state: "state", zip: 12345)
    end
  describe 'As a visitor' do
    describe 'When I visit the shelter show page and click the delete shelter link' do
      it 'deletes the shelter' do

        visit "/shelters/#{@shelter1.id}"
        click_on 'Delete Shelter'

        expect(page).to have_content(@shelter2.name)
        expect(page).to_not have_content(@shelter1.name)



      end
    end
  end
end
