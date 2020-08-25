require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit the shelter show page' do
    it "I see a list of reviews for shelter with
    title, rating, content, and optional picture" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    require "pry"
    binding.pry
    @review = ShelterReview.create!(title: "ShelterReview1", rating: 5, content: "This app sucks", image: "https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg")

      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_content(@shelter1.title)
      expect(page).to have_content("#{@shelter1.rating}")
      expect(page).to have_content("#{@shelter1.content}")
      expect(page).to have_content("#{@shelter1.expect(page).to have_css("img[src*='#{"https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg"}']")}")
    end
  end
end
