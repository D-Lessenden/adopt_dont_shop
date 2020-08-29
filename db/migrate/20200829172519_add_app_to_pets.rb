class AddAppToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :app, foreign_key: true
  end
end
