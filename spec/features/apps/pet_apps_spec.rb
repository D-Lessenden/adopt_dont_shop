require 'rails_helper'

RSpec.describe 'ApplicationPets index page' do
  it "has a link from the pets show page" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
    @app2 = App.create!(name: "app2", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")

    ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )
    ApplicationPet.create(pet_id: @pet1.id, app_id: @app2.id )

    visit "/pets/#{@pet1.id}"
    click_on 'Applications'
    expect(current_path).to eq("/apps/pet_apps/#{@pet1.id}")
  end

  it "has links the applicants name" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")

    ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )

    visit "/pets/#{@pet1.id}"
    click_on 'Applications'
    expect(current_path).to eq("/apps/pet_apps/#{@pet1.id}")

    expect(page).to have_content("app1")
  end

  it "has links to more than one applicants name" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")
    @app2 = App.create!(name: "app2", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs")

    ApplicationPet.create(pet_id: @pet1.id, app_id: @app1.id )
    ApplicationPet.create(pet_id: @pet1.id, app_id: @app2.id )

    visit "/pets/#{@pet1.id}"
    click_on 'Applications'
    expect(current_path).to eq("/apps/pet_apps/#{@pet1.id}")

    expect(page).to have_content("app1")
    expect(page).to have_content("app2")
  end

  it "has a message if there are no applications" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    visit "/pets/#{@pet1.id}"
    click_on 'Applications'
    expect(page).to have_content("No applications for this pet")
  end
end
