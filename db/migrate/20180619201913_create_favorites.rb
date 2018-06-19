class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :description
      t.string :name
      t.string :image
      
      t.timestamps
    end
  end
end
