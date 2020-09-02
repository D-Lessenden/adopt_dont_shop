require 'rails_helper'
#
# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system
RSpec.describe 'Shelters index page' do
  before :each do
      @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    end

    describe 'it in more details' do
      describe 'it even more' do
    it "I see each shelters info" do
      visit '/shelters'

      expect(page).to have_content(@shelter1.name)

      click_link 'Update Shelter'
      expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")


      visit '/shelters'

      expect(page).to have_content(@shelter1.name)
      click_on 'Delete Shelter'
      expect(page).to_not have_content(@shelter1.name)
    end

    describe "As a user" do
      it "I can go to the shelter's show page from index" do
      visit '/shelters'

      click_on "Shelter1"

      expect(current_path).to eq("/shelters/#{@shelter1.id}")

      expect(page).to have_content(@shelter1.name)
      expect(page).to have_content(@shelter1.address)
      expect(page).to have_content(@shelter1.city)
      expect(page).to have_content(@shelter1.state)
      expect(page).to have_content(@shelter1.zip)



      end
    end
      end
    end

    describe "As a user" do
      it "I can go to the pets's show page from shelters index" do
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
      visit "/shelters/#{@shelter1.id}/pets"
      click_on "snowball"

      expect(current_path).to eq("/pets/#{@pet1.id}")

      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.adoption_status)
    end
  end

  end
