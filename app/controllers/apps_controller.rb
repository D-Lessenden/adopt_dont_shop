class AppsController < ApplicationController
  def index
    if params[:App]
      @App = params[:App]
      @pets = Pet.where App: params[:App]
     else
      @pets = Pet.all
     end
  end

  def new
  end

  def create
    app = App.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone_number: params[:phone_number],
      description: params[:description]
      })
  end

  def update
    @pet = Pet.find(params[:pet_id])
    app = App.new(session[:app])
    app.add_pet(@pet)
    session[:app] = app.fav_list
    #flash[:notice] = "Added to favorites"
    #redirect_to "/pets/#{@pet.id}"
  end


end
