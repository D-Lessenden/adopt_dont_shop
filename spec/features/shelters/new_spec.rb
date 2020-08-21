# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.

require 'rails_helper'

RSpec.describe 'New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the new shelter form by clicking a link on the index' do
      it 'I can create a new shelter' do
        visit '/shelters'

        click_link 'New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in 'shelter[name]', with: 'Pa and Paws'
        fill_in 'shelter[address]', with: 'road avenue'
        fill_in 'shelter[city]', with: 'Pitt'
        fill_in 'shelter[state]', with: 'PA'
        fill_in 'shelter[zip]', with: 12345



        click_on 'Create Shelter'

        expect(current_path).to eq("/shelters")
        expect(page).to have_content('Pa and Paws')
        expect(page).to have_content('road avenue')
        expect(page).to have_content('Pitt')
        expect(page).to have_content('PA')
        expect(page).to have_content(12345)
      end
    end
  end
end
