class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

  end

  def display

    @search_results = params[:search_results]
    @favorite = Favorite.new
    # array of character objects returned by search function
      # SET VALUES


    if !current_user
      redirect_to "/favorites/index"
    else

      # BUILD FORM BACK END HERE
    end

  end

  def create
   @favorite = Favorite.new
   @favorite.title = params[:title]
   @favorite.name = params[:name]
   @favorite.image = params[:image]
   @favorite.description = params[:description]
   @favorite.user_id = current_user.id
        if @favorite.save
          flash[:success] = "Here are your results!"
          redirect_to "/favorite/#{@favorite.id}"
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










