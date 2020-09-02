require "rails_helper"

describe "As a visitor" do
  it "When I visit an applications show page '/applications/:id I see the name, address, city, state, zip, phone number, message of why, and the names of all pet names of the app linked to their show page'" do

    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
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
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )

    visit "/app/#{@app1.id}"

    within("#pet-#{@app1.pets.first.id}") do
      click_on("approve")
    expect(current_path).to eq("/pets/#{@app1.pets.first.id}")

    end
  end

  it "when an app is made for more than 1 pet, when I visit the app show page. I'm able to approve the app for any number of pets" do
      @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

      @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
      @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
      @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
      ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )

      visit "/app/#{@app1.id}"

      expect(page).to have_content("approve")
      click_on "approve"
      expect(current_path).to eq("/pets/#{@app1.pets.first.id}")
    end

    it "Pets can only have one approved application on them at any time" do
      @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)

      @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
      @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
      @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
      ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )

      visit "/app/#{@app1.id}"

      expect(page).to have_content("approve")
      click_on "approve"

      visit "/app/#{@app1.id}"
      save_and_open_page
      expect(page).to have_content("revoke")
      expect(page).to have_content("Pet")
      expect(page).to have_content("description")
    end
  end
