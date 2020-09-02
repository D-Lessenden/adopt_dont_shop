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
    # shelter.save
    # redirect_to '/shelters'
    if shelter.save
      redirect_to "/shelters"
    else
      flash[:alert] = "All feilds are required"
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
    # shelter.save
    # redirect_to "/shelters/#{shelter.id}"
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:alert] = "All feilds are required"
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
