class FavoritesController < ApplicationController
  def index
    if params[:favorite]
      @favorite = params[:favorite]
     @pets = Pet.where favorite: params[:favorite]
     else
      @pets = Pet.all
     end
  end

  def update
    pet = Pet.find(params[:pet_id])

    if pet.favorite
      pet.favorite = false
    else
      pet.favorite = true
      flash[:notice] = "Added to favorites"
    end
    pet.save
    redirect_to "/pets/#{pet.id}"

  end


end
