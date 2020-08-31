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
      pet_id: params[:pet_id]
      })

      if app.save
        flash[:notice] = "Your application has been submitted"
        session[:favorite].each do |k, v|
          if params[:adopt][:pet_id].include?(k)
            session[:favorite].delete(k)
            redirect_to "/favorites"
          end
        end
      else
          flash[:alert] = "All fields are required"
          redirect_to "/apps/new"
      end

   def show
     @app = App.find(params[:id])
   end
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
