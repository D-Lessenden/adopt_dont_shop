require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the shelter show page' do
    it "then I see a list of reviews for shelter with
    title, rating, content, an optional picture" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @review = Review.create!(title: "ShelterReview1", rating: 5, content: "This app sucks", picture: "https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg", shelter_id: @shelter1.id)
    visit "/shelters/#{@shelter1.id}"
      expect(page).to have_content(@review.title)
      expect(page).to have_content(@review.rating)
      expect(page).to have_content(@review.content)
      expect(page).to have_css("img[src*='#{"https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg"}']")
    end
  end
end
