class FavoritesController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  def show
  end
  
  def edit
  end

  def update
  end

 

  private 
  def favorite_params
    params.require(:favorite).permit(:title, :description, :name, :image)

  end
end
