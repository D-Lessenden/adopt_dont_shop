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
    if reviews.count > 0
      average = 0
      reviews.each do |review|
        average += review.rating
      end
      (average / reviews.count).to_f
    end
  end

  def count_of_apps
    applications = 0
    pets.each do |pet|
      applications += pet.apps.count
      pet
    end
    applications
  end

  def delete_pets
    pets.each do |pet|
      pet.apps.clear
      pets.clear
    end
  end

end
