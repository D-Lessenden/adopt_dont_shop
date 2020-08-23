# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
require 'rails_helper'
RSpec.describe 'Pets index page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "url", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    end

    describe 'As a visitor' do
    it "I see each pets info" do
      visit '/pets'

      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.shelter.name)



      click_link 'Update Pet'
      expect(current_path).to eq("/pets/#{@pet1.id}/edit")

      visit '/pets'
      expect(page).to have_content(@pet1.name)
      click_on 'Delete Pet'
      expect(page).to_not have_content(@pet1.name)

      end
    end
  end
