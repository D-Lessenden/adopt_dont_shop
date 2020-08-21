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
      @shelter2 = Shelter.create(name: "Shelter2", address: "address", city: "city", state: "state", zip: 12345)
    end

    describe 'it in more details' do
      describe 'it even more' do
    it "I see each song's title" do
      visit '/shelters'

      expect(page).to have_content(@shelter1.name)
      expect(page).to have_content(@shelter2.name)
    end

      end
    end
  end
