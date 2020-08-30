class ApplicationPet < ApplicationRecord
  has_many :apps
  has_many :pets
end
