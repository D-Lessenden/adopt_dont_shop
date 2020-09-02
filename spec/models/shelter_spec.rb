require 'rails_helper'

describe Shelter, type: :model do
  describe 'relationships' do
      it { should have_many :pets }
    end

  describe 'relationships' do
      it { should have_many :reviews }
    end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many(:pets).dependent(:delete_all) }
  end

  describe "relationships" do
    it { should have_many(:reviews).dependent(:delete_all) }
  end

  it "can count the number of pets" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    expect(@shelter1.count_of_pets).to eq(2)
  end

  it "can average reviews" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @review1 = Review.create!(title: "Title", rating: 4, content: "qwerty", shelter_id: @shelter1.id)
    @review2 = Review.create!(title: "Title2", rating: 3, content: "qwerty", shelter_id: @shelter1.id)

    expect(@shelter1.average_review).to eq(3.5)
  end

  it "can count number of applications" do
    @shelter1 = Shelter.create!(name: "Shelter1", address: "address", city: "city", state: "state", zip: 12345)
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id, description: "qwerty")
    @app1 = App.create!(name: "app1", address: "121 Silly Ave", city: "Sillytown", state: "CO", zip: 80022, phone_number: 7207202, description: "we love dogs", pet_id: @pet1.id)
    ApplicationPet.create!(app_id: @app1.id, pet_id: @pet1.id)
    expect(@shelter1.count_of_apps).to eq(1)
  end







end
