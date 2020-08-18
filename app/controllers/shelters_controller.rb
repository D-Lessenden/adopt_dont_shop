class SheltersController < ApplicationController
  def index
    #@shelters = ['Shelter 1', 'Shelter 2', 'Shelter 3']
    @shelters = Shelter.all
  end

  def show
    @shelters = Shelter.find(params[:id])
  end

  def create
  end

end
