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


      end
    end
    # describe 'As a visitor' do
    #   describe 'When I visit the shelter index page' do
    #     describe "Next to every shelter, I see a link to edit that shelter' info" do
    #     describe "I should be taken to that shelters edit page where I can update its information just like in User Story 5" do
    #       visit '/shelters'
    #       click_link 'Update Shelter'
    #       expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")
    #
    #
    #     end
    #   end
    #   end
    # end
  end
