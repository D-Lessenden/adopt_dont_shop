class Pet < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :shelter

  def set_defaults
    self.adoption_status ||= "Adoptable"
  end

end
