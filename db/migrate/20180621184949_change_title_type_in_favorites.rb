class ChangeTitleTypeInFavorites < ActiveRecord::Migration[5.2]
  def change	
     change_column :favorites, :title, :array
  end
end
