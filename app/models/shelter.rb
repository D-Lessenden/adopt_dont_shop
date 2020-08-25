class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews
  validates_presence_of :name
end
