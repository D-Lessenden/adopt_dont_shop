require 'rails_helper'

describe Review, type: :model do
  describe 'relationships' do
      it { should belong_to :shelter }
    end

  describe "validations" do
    it { should validate_presence_of :title }
  end

  describe "validations" do
    it { should validate_presence_of :rating }
  end

  describe "validations" do
    it { should validate_presence_of :content }
  end



end
