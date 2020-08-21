# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
require 'rails_helper'

RSpec.describe 'Edit Shelter' do
  before :each do
    @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
  end

  describe 'As a visitor' do
    describe 'When I visit the shelter edit form by clicking a link on the shelter show page' do
      it 'I can edit a field in shelter' do
        visit "/shelters/#{@shelter1.id}"
        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")

        fill_in 'shelter[name]', with: 'Shelter2'
        fill_in 'shelter[address]', with: 'a different street'
        fill_in 'shelter[city]', with: 'Topeka'
        fill_in 'shelter[state]', with: 'KS'
        fill_in 'shelter[zip]', with: 54321
        click_on 'Update Shelter'

        expect(current_path). to eq("/shelters/#{@shelter1.id}")
        expect(page).to have_content('Shelter2')
        expect(page).to have_content('a different street')
        expect(page).to have_content('Topeka')
        expect(page).to have_content('KS')
        expect(page).to have_content(54321)




      end
    end
  end
end
