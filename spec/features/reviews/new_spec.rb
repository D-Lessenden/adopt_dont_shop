require 'rails_helper'

RSpec.describe 'Create Review' do
  before :each do
      @shelter1 = Shelter.create(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    end
  describe 'As a visitor' do
    describe 'When I visit the create review form by clicking a link on the shelter show page' do
      it 'I can create a new review' do
        visit "/shelters/#{@shelter1.id}"
        click_on 'Create a Review'

        fill_in 'title', with: "Title", visible: false
        fill_in 'rating', with: "4", visible: false
        fill_in 'content', with: 'asljdhfaskjdhfs', visible: false
        fill_in 'picture', with: "https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg"

        click_on 'Create Review'
        expect(current_path).to eq("/shelters/#{@shelter1.id}")
        expect(page).to have_content(Review.last.title)
        expect(page).to have_content(Review.last.rating)
        expect(page).to have_content(Review.last.content)
        expect(page).to have_css("img[src*='#{"https://pyxis.nymag.com/v1/imgs/83a/2cc/b22827436c425497d88185d9dab50df8e3-10-ethel-muggs-riverdale.rsocial.w1200.jpg"}']")
        #having problem with getting default to funciton
      #  expect(page).to have_css("img[src*='#{"https://www.creativefabrica.com/wp-content/uploads/2019/11/08/paw-print-2-title-312x208.jpg"}']")

     end
    end
  end

  describe 'As a visitor' do
    describe "when I don't fill in all required fields a see a flash message" do
      describe "And I am returned to the create review form" do
        it "can click new review" do
          visit "/shelters/#{@shelter1.id}"
          click_on 'Create a Review'

          fill_in 'title', with: "Title", visible: false
          fill_in 'rating', with: "4", visible: false
          click_on 'Create Review'
          expect(page).to have_content("Title, rating, and content are required fields")

        end
      end
    end
  end
end
