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
end
