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
    click_on "#{@app1.pets.first.name}"
    expect(current_path).to eq("/pets/#{@app1.pets.first.id}")
  end

  it "Shows link to approve application for that specific pet. When clicked on, routes back to that pet's show page with a pet status change to pending. Also, we see test reading the name of the applicant in a statement such as 'On hold for <name>'" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )
    # @pet2.apps.create(app_id: @app2.id)

    visit "/app/#{@app1.id}"

    within("#pet-#{@app1.pets.first.id}") do
      click_on("approve")
    expect(current_path).to eq("/pets/#{@app1.pets.first.id}")
    end
    expect(page).to have_content("pending")
  end
end

# User Story 22, Approving an Application
#
# As a visitor
# When I visit an application's show page
# For every pet that the application is for, I see a link to approve the application for that specific pet
# When I click on a link to approve the application for one particular pet
# I'm taken back to that pet's show page
# And I see that the pets status has changed to 'pending'
# And I see text on the page that says who this pet is on hold for (Ex: "On hold for John Smith", given John Smith is the name on the application that was just accepted)
