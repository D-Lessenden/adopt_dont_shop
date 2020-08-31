require 'rails_helper'

describe Pet, type: :model do
  describe 'relationships' do
      it { should belong_to :shelter }
      it { should have_many :application_pets }
          it {should have_many(:apps).through(:application_pets)}
    end

  describe "relationships" do
    it { should have_many :apps }
  end
end
