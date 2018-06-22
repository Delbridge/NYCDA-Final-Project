class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

  end

  def calendar
    if !current_user
      redirect_to "/favorites/guest"
    end
    @favorites = Favorite.all
    @upcoming_comics = helpers.new_comics_search(@favorites)
  end

  def landing
  end
  
  def display
    
    if !current_user
      redirect_to "/favorites/index"
    end

    @search_results = params[:search_results]
    @favorite = Favorite.new
    # array of character objects returned by search function
      # SET VALUES

  end

  def create
   @favorite = Favorite.new
   @favorite.title = params[:title].split(",")
   @favorite.name = params[:name]
   @favorite.image = params[:image]
   @favorite.description = params[:description]
   @favorite.user_id = current_user.id
        if @favorite.save
          flash[:success] = "Here are your results!"
          redirect_to "/favorites/index"
        else
          render "/"
        end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end



  def destroy
    @favorite = Favorite.find(params[:project])
    @favorite.destroy
    redirect_to "/favorites/index"


  end
  
  def landing
    render "favorites/landing"
  end

  
  

  private 
  def favorite_params
    params.require(:favorite).permit(:title, :description, :name, :image, :user_id)

  end
end










