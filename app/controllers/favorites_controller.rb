class FavoritesController < ApplicationController
  def index
    @favorites= Favoite.all

  end

  def new

  end

  def create

  end

  def show
<<<<<<< HEAD
  end
  
  def edit
  end

  def update
=======
    @favorite = Favorite.find(params[:id])


>>>>>>> f3e49afd0b9e3e7964d4ab4663a78f16e70f16d8
  end
  

 

  private 
  def favorite_params
    params.require(:favorite).permit(:title, :description, :name, :image)

  end
end
