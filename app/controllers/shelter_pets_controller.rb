class ShelterPetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter_id = params[:shelter_id]
     @pets = Pet.where shelter_id: params[:shelter_id]
     else
      @pets = Pet.all
     end
  end

  def create
    pet = Pet.new({
      image: params[:pet][:image],
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      shelter_id: params[:pet][:shelter_id],
      description: params[:pet][:description],
      adoption_status: params[:pet][:adoption_status]

      })
    pet.save
    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

end
