class Pet < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :shelter
  belongs_to :app

  def set_defaults
    self.adoption_status ||= "Adoptable"
  #  self.favorite ||= false
  end

end
