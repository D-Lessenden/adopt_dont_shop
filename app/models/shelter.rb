class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  validates_presence_of :name
end
