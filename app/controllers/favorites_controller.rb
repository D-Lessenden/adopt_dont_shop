class FavoritesController < ApplicationController

  def index

    if params[:favorite]
      @favorite = params[:favorite]
      @pets = Pet.where favorite: params[:favorite]
     else
      @pets = Pet.all
     end

     if params[:favorite]
       @favorite = params[:favorite]
       @apps = Pet.where favorite: params[:favorite]
      else
        @apps = App.all
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

  def destroy
    @pet = Pet.find(params[:pet_id])
    session[:favorite].delete("#{@pet.id}")
    flash[:notice] = "Removed from favorites"
    redirect_to "/pets/#{@pet.id}"
  end

  def delete
    @pet = Pet.find(params[:pet_id])
    session[:favorite].delete("#{@pet.id}")
    flash[:notice] = "Removed from favorites"
    redirect_to "/favorites"
  end


  def delete_all
    session[:favorite].clear
    flash[:notice] = "Everyone Removed"
    redirect_to "/favorites"
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
