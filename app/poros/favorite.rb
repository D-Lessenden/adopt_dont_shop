class Favorite
  attr_reader :fav_list
  #maybe make this into an array
  def initialize(fav_list)
    if fav_list
      @fav_list = fav_list
    else
      @fav_list ||= Hash.new
      #make this ||=Array.new
    end
  end

  def add_pet(pet)
    #shovel into an array
    pet_id_str = pet.id.to_s
    @fav_list[pet_id_str] ||= 0
    @fav_list[pet_id_str] += 1
  end

  def total_favorites(pet)
    pet_id_str = pet.id.to_s
    @fav_list[pet_id_str]
  end

  def minus_from_fave(pet)
    require "pry"
    binding.pry
  end
end
