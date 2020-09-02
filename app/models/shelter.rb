class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  validates_presence_of :name

  def has_pending?
    pets.any?{ |pet| pet.adoption_status == "pending"}
  end
end
