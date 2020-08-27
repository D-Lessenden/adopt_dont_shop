class FavoritesController < ApplicationController


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
