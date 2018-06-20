class FavoritesController < ApplicationController
  def index
    @favorites= Favoite.all

  end

  def new

  end

  def create

  end


  def show
    @favorite = Favorite.find(params[:id])


  end
  

  private 
  def favorite_params
    params.require(:favorite).permit(:title, :description, :name, :image)

  end
end
