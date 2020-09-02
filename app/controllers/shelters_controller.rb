class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
    if shelter.save
      redirect_to "/shelters"
    else
          flash[:alert_name] = "Name is a required field" if shelter.name.empty?
          flash[:alert_address] = "Address is a required field" if shelter.address.empty?
          flash[:alert_city] = "City is a required field" if shelter.city.empty?
          flash[:alert_state] = "State is a required field" if shelter.state.empty?
          flash[:alert_zip] = "Zip is a required field" if shelter.zip.nil?
        redirect_to "/shelters/new"
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
    else
          flash[:alert_name] = "Name is a required field" if shelter.name.empty?
          flash[:alert_address] = "Address is a required field" if shelter.address.empty?
          flash[:alert_city] = "City is a required field" if shelter.city.empty?
          flash[:alert_state] = "State is a required field" if shelter.state.empty?
          flash[:alert_zip] = "Zip is a required field" if shelter.zip.nil?
          redirect_to "/shelters/#{shelter.id}/edit"
    end
    
  end

  def destroy
    @shelter = Shelter.find(params[:id])
    @shelter.delete_pets
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

end
