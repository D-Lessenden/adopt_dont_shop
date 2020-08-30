class RemoveAppIdFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :app_id, :bigint
  end
end
