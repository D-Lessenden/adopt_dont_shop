class AppsController < ApplicationController
  def index
    if params[:app_id]
      @app_id = params[:app_id]
      @pets = Pet.where app_id: params[:app_id]
     else
      @pets = Pet.all
     end
  end

  def new
  #  @pet_id = params[:pet_id]
    @pets = Pet.all

  end

  def create
    #@pets = Pet.all

    app = App.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone_number: params[:phone_number],
      description: params[:description],
      #pet_id: params[:pet_id]
      })

      if app.save
        flash[:notice] = "Your application has been submitted"

        params[:adopt][:pet_id].shift
        pets = Pet.find(params[:adopt][:pet_id])
        pets.each do |pet|
          ApplicationPet.create(app_id: app, pet_id: pet)
        end
      #  binding.pry

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

end
