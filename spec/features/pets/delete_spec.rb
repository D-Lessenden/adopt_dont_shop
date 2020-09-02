require 'rails_helper'

RSpec.describe 'Delete Pet' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
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
