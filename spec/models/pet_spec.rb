require 'rails_helper'

describe Pet, type: :model do
  describe 'relationships' do
      it { should belong_to :shelter }
    end

  describe 'relationships' do
      it { should belong_to :app }
    end
end
