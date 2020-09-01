class AppsController < ApplicationController
  def index
    @app = App.find(params[:id])

    if params[:app_id]
      @app_id = params[:app_id]
      @pets = Pet.where app_id: params[:app_id]
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
      description: params[:description],
      pet_id: params[:adopt][:pet_id].shift
      })

      if app.save
        flash[:notice] = "Your application has been submitted"

        params[:adopt][:pet_id]
        pets = Pet.find(params[:adopt][:pet_id])
        pets.each do |pet|
          #app: app pet: pet
        #  app.pets.create!
        ApplicationPet.create!(app_id: app.id, pet_id: pet.id)
        end
        #binding.pry

        session[:favorite].each do |k, v|
          if params[:adopt][:pet_id].include?(k)
            session[:favorite].delete(k)
          end
        end
        redirect_to "/favorites"
      else
          flash[:alert] = "All fields are required"
          redirect_to "/apps/new"
      end
  end

   def show
     @app = App.find(params[:id])
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
