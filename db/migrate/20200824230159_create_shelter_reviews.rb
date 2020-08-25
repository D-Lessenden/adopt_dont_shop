class CreateShelterReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :shelter_reviews do |t|
      t.string :title
      t.integer :rating
      t.string :content
      t.string :picture
    end
  end
end
