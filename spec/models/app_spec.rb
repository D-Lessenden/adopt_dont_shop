require 'rails_helper'

describe App, type: :model do
  describe "validations" do
    it { should have_many :application_pets }
    it {should have_many(:pets).through(:application_pets)}
    it { should validate_presence_of :name }
  end

  describe "validations" do
    it { should validate_presence_of :address }
  end

  describe "validations" do
    it { should validate_presence_of :city }
  end

  describe "validations" do
    it { should validate_presence_of :state }
  end

  describe "validations" do
    it { should validate_presence_of :zip }
  end

  describe "validations" do
    it { should validate_presence_of :phone_number }
  end

  describe "validations" do
    it { should validate_presence_of :description }
  end

end
