# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where
# I see the Pet's updated information
require 'rails_helper'

RSpec.describe 'Edit Pet' do
  before :each do
    @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "url", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
  end

  describe 'As a visitor' do
    describe 'When I visit a Pet Show page Then I see a link to update that Pet "Update Pet"' do
      it 'I can edit a field in shelter' do
        visit "/pets/#{@pet1.id}"
        click_on 'Update Pet'

        expect(current_path).to eq("/pets/#{@pet1.id}/edit")

        fill_in 'pet[image]', with: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1"
        fill_in 'pet[name]', with: 'qwerty'
        fill_in 'pet[description]', with: 'laksjdfalskjdf'
        fill_in 'pet[approximate_age]', with: 5
        fill_in 'pet[sex]', with: "female"
        click_on 'Update Pet'

        expect(current_path). to eq("/pets/#{@pet1.id}")
        expect(page).to have_css("img[src*='#{"https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1"}']")
        expect(page).to have_content('qwerty')
        expect(page).to have_content('laksjdfalskjdf')
        expect(page).to have_content(5)
        expect(page).to have_content("female")




      end
    end
  end
end
