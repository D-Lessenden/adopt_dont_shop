class Pet < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :shelter
  has_many :apps

  def set_defaults
    self.adoption_status ||= "Adoptable"
  #  self.favorite ||= false
  end

end
