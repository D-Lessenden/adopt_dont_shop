class PetsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter_id = params[:shelter_id]
      @pets = Pet.where shelter_id: params[:shelter_id]
    else
      @pets = Pet.all
    end
  end

  def show
    @application_pets = ApplicationPet.where(id: params[:id].to_i)
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    pet = Pet.new({

      image: params[:pet][:image],
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      shelter_id: params[:shelter_id],
      description: params[:pet][:description],
      adoption_status: params[:pet][:adoption_status]

      })
      if pet.save
        redirect_to "/shelters/#{pet.shelter_id}/pets"
      else
        flash[:alert_image] = "Image is a required field" if pet.image.empty?
        flash[:alert_name] = "Name is a required field" if pet.name.empty?
        flash[:alert_description] = "Description is a required field" if pet.description.empty?
        flash[:alert_age] = "Age is a required field" if pet.approximate_age.nil?
        flash[:alert_sex] = "Sex is a required field" if pet.sex.empty?
        redirect_to "/shelters/#{pet.shelter_id}/pets/new"
      end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if params[:approve] == 'true'
       pet.update( {adoption_status: "pending"})
       redirect_to "/pets/#{pet.id}"
     elsif params[:approve] == 'false'
       pet.update( {adoption_status: "Adoptable"})
       redirect_to request.referrer
     else
      pet.update({
        image: params[:image],
        name: params[:name],
        description: params[:description],
        approximate_age: params[:approximate_age],
        sex: params[:sex],
        shelter_id: params[:shelter_id],
        })
        if pet.save
          redirect_to "/pets/#{pet.id}"
        else
          flash[:alert_image] = "Image is a required field" if pet.image.empty?
          flash[:alert_name] = "Name is a required field" if pet.name.empty?
          flash[:alert_description] = "Description is a required field" if pet.description.empty?
          flash[:alert_age] = "Age is a required field" if pet.approximate_age.nil?
          flash[:alert_sex] = "Sex is a required field" if pet.sex.empty?
          redirect_to request.referrer
        end
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    Pet.destroy(params[:id])
    if session[:favorite] != nil
    session[:favorite].each do |k, v|
        if params[:id].include?(k)
          session[:favorite].delete(k)
        end
      end
    end
    redirect_to '/pets'
  end

end
