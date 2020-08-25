require 'rails_helper'

RSpec.describe 'Create Review' do
  before :each do
      @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    end
  describe 'As a visitor' do
    describe 'When I visit the create review form by clicking a link on the shelter show page' do
      it 'I can create a new pet' do
        visit "/shelters/#{@shelter1.id}"

        click_on 'Create a Review'
        fill_in 'review[title]', with: "Title"
        fill_in 'review[rating]', with: 4
        fill_in 'review[content]', with: 'asljdhfaskjdhfs'
        fill_in 'review[picture]', with: "https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg"

        click_on 'Create Review'
        expect(current_path).to eq("/shelters/#{@shelter1.id}")
        expect(page).to have_content(Review.last.title)
        expect(page).to have_content(Review.last.rating)
        expect(page).to have_content(Review.last.content)

        #having problem with getting default to funciton
     end
    end
  end
end
