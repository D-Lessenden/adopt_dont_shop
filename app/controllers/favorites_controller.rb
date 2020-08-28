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
    @pet = Pet.find(params[:pet_id])
    favorite = Favorite.new(session[:favorite])
    favorite.add_pet(@pet)
    session[:favorite] = favorite.fav_list
    flash[:notice] = "Added to favorites"
    redirect_to "/pets/#{@pet.id}"
  end

  def delete

  end


end



#
# def index
#   if params[:favorite]
#     @favorite = params[:favorite]
#    @pets = Pet.where favorite: params[:favorite]
#    else
#     @pets = Pet.all
#    end
# end
#
# def update
#   pet = Pet.find(params[:pet_id])
#
#   if pet.favorite
#     pet.favorite = false
#     flash[:notice] = "Removed from favorites"
#   else
#     pet.favorite = true
#     flash[:notice] = "Added to favorites"
#   end
#   pet.save
#   redirect_to "/pets/#{pet.id}"
#
# end
