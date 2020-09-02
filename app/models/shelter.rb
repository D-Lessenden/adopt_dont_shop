class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  validates_presence_of :name, :address, :city, :state, :zip

  def has_pending?
    pets.any?{ |pet| pet.adoption_status == "pending"}
  end

  def count_of_pets
    pets.count
  end

  def average_review
    average = 0
    reviews.each do |review|
      average += review.rating
    end
    average / reviews.count
  end

  def count_of_apps
    applications = 0
    pets.each do |pet|
      applications += pet.apps.count
      pet
    end
    applications
  end

end
