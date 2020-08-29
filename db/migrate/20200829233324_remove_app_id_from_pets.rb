class RemoveAppIdFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :pet_id, :bigint
  end
end
