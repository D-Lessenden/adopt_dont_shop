class ApplicationPetsController < ApplicationController
  def new
    @apps = App.all

  end

  def create
    app = App.find(params[:app_id])
    pet = Pet.find(params[:pet_id])
    ApplicationPet.create(app: app, pet: pet)
    redirect_to "/favorites"
  end
end
