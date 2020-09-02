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
    @pet1 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "snowball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)
    @pet2 = Pet.create!(image: "https://i0.wp.com/metro.co.uk/wp-content/uploads/2018/10/sei_34729092-e1539335371430.jpg?quality=90&strip=all&zoom=1&resize=540%2C380&ssl=1", name: "fireball", approximate_age: 5, sex: "male", shelter_id: @shelter1.id)

    expect(@shelter1.count_of_pets).to eq(2)
  end



end
