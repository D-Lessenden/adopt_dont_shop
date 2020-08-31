require "rails_helper"

describe "As a visitor" do
  it "When I visit an applications show page '/applications/:id I see the name, address, city, state, zip, phone number, message of why, and the names of all pet names of the app linked to their show page'" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )
    # @pet2.apps.create(app_id: @app2.id)

    visit "/app/#{@app1.id}"

    expect(page).to have_content(@app1.name)
    expect(page).to have_content(@app1.address)
    expect(page).to have_content(@app1.city)
    expect(page).to have_content(@app1.state)
    expect(page).to have_content(@app1.zip)
    expect(page).to have_content(@app1.phone_number)
    expect(page).to have_content(@app1.description)
    expect(page).to have_content(@app1.pets.first.name)

  end
end

# User Story 19, Application Show Page
#
# As a visitor
# When I visit an applications show page "/applications/:id"
# I can see the following:
# - name
# - address
# - city
# - state
# - zip
# - phone number
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pet's that this application is for (all names of pets should be links to their show page)
