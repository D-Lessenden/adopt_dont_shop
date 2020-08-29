class Favorite
  attr_reader :fav_list

  def initialize(fav_list)
    if fav_list
      @fav_list = fav_list
    else
      @fav_list ||= Hash.new
    end 
  end

  def add_pet(pet)
    pet_id_str = pet.id.to_s
    @fav_list[pet_id_str] ||= 0
    @fav_list[pet_id_str] += 1
  end

  def total_favorites(pet)
    pet_id_str = pet.id.to_s
    @fav_list[pet_id_str]
  end

end
