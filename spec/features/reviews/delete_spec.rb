require 'rails_helper'

RSpec.describe 'Delete Review' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @review1 = Review.create!(title: "review1", rating: 5, content: "ljoihoiehfoiuh", shelter_id: @shelter1.id)
    end
  describe 'As a visitor' do
    describe 'When I visit the review show page and click the delete review link' do
      it 'deletes the review' do

        visit "/shelters/#{@shelter1.id}"
        click_on 'Delete Review'

        expect(page).to_not have_content(@review1.title)

      end
    end
  end
end
