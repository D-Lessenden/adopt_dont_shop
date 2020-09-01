class PetsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter_id = params[:shelter_id]
     @pets = Pet.where shelter_id: params[:shelter_id]
     else
      @pets = Pet.all
     end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    pet = Pet.new({

      image: params[:pet][:image],
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      shelter_id: params[:shelter_id],
      description: params[:pet][:description],
      adoption_status: params[:pet][:adoption_status]

      })
    pet.save

    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if params[:approve] == 'true'
      pet.update( {adoption_status: "pending"})
      require "pry"
      binding.pry
    else
    pet.update({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter_id: params[:shelter_id],
      adoption_status: params[:adoption_status],
      })
    end
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  # def favorite_count
  #   count = 0
  #   @pets.each do |pet|
  #     if pet.favorite == true
  #       count += 1
  #     end
  #       count
  #     end
  # end

  # private
  # def pet_params
  #   params.require(:pet).permit(:image, :name, :approximate_age, :sex, :shelter_id, :description, :adoption_status)
  # end

end
