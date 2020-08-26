require 'rails_helper'

RSpec.describe 'Edit Reviews' do
  before :each do
    @shelter = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @review = Review.create(title: "ShelterReview1", rating: 5, content: "This app sucks", picture: "https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg", shelter_id: @shelter.id)
  end

  describe 'As a visitor' do
    describe 'When I visit a Shelter Show page then I see a link to update that review "Edit Review"' do
      it 'I can edit a field in review' do
        visit "/shelters/#{@shelter.id}"
        click_on 'Edit Review'

        expect(current_path).to eq("/reviews/#{@review.id}/edit")

        fill_in 'title', with: "OtherShelter"
        fill_in 'rating', with: 3
        fill_in 'content', with: 'laksjdfalskjdf'
        fill_in 'picture', with: "https://www.creativefabrica.com/wp-content/uploads/2019/11/08/paw-print-2-title-312x208.jpg"

        click_on 'Update Review'

        expect(current_path). to eq("/shelters/#{@review.shelter_id}")
        expect(page).to have_content('OtherShelter')
        expect(page).to have_content(3)
        expect(page).to have_content('laksjdfalskjdf')
        expect(page).to have_css("img[src*='#{"https://www.creativefabrica.com/wp-content/uploads/2019/11/08/paw-print-2-title-312x208.jpg"}']")



      end
    end
  end
end
