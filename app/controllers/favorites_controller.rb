class FavoritesController < ApplicationController
  def index

    @favorites = Favorite.all
  end

  def display
    if !current_user
      redirect_to "/"
    else
      @favorite=Favorite.new
    end

    @search_results = []

    Favorite.each do 
      @search_results << Favorite.new
    end

  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id=current_user.id



  end

  def show
    @favorite = Favorite.find(params[:id])
  end
  

  
  



 

  private 
  def favorite_params
    params.require(:favorite).permit(:title, :description, :name, :image)

  end
end
