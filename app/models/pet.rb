class Pet < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :shelter
  has_many :application_pets
  has_many :apps, through: :application_pets
  
  def set_defaults
    self.adoption_status ||= "Adoptable"
  #  self.favorite ||= false
  end

end
