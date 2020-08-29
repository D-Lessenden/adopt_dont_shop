class AddPetToApps < ActiveRecord::Migration[5.2]
  def change
    add_reference :apps, :pet, foreign_key: true
  end
end
