
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets
#Index page where I can see the new pet listed
require 'rails_helper'

RSpec.describe 'Create Pet' do
  before :each do
      @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    end
  describe 'As a visitor' do
    describe 'When I visit the create pet form by clicking a link on the index' do
      it 'I can create a new pet' do
        visit "/shelters/#{@shelter1.id}/pets/new"

        #click_link 'Create Pet'

        expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

        fill_in 'pet[image]', with: 'url'
        fill_in 'pet[name]', with: 'kibbles'
        fill_in 'pet[description]', with: 'asljdhfaskjdhfs'
        fill_in 'pet[approximate_age]', with: 5
        fill_in 'pet[sex]', with: 'male'



        click_on 'Create Pet'

        expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")
        expect(page).to have_content('url')
        expect(page).to have_content('kibbles')
        expect(page).to have_content('asljdhfaskjdhfs')
        expect(page).to have_content(5)
        expect(page).to have_content('male')
      end
    end
  end
end
