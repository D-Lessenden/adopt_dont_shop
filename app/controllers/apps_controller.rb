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
    @pets = Pet.all
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
      # app.save
      # redirect_to "/favorites"
      if app.save
        flash[:notice] = "Your application has been submitted"
          # @pets.each do |pet|
          #   pet.
          # end

        redirect_to "/favorites"
      else
        flash[:alert] = "All fields are required"
        redirect_to "/apps/new"
      end
  end

  # def update
  #   @pet = Pet.find(params[:pet_id])
  #   app = App.new(session[:app])
  #   app.add_pet(@pet)
  #   session[:app] = app.fav_list
  #   #flash[:notice] = "Added to favorites"
  #   #redirect_to "/pets/#{@pet.id}"
  # end


end
