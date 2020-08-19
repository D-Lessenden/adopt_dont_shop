class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :approximate_age
      t.string :integer
      t.string :sex
    end
  end
end
