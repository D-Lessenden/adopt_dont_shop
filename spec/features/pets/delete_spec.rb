require 'rails_helper'

RSpec.describe 'Delete Pet' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "url", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "url", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    end
  describe 'As a visitor' do
    describe 'When I visit the pet show page and click the delete pet link' do
      it 'deletes the pet' do

        visit "/pets/#{@pet1.id}"
        click_on 'Delete Pet'

        expect(page).to have_content(@pet2.name)
        expect(page).to_not have_content(@pet1.name)

      end
    end
  end
end
