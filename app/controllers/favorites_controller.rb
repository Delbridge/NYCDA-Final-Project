class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

  end

  def display

    @search_results = params[:search_results]
    # array of character objects returned by search function
      # SET VALUES


    if !current_user
      redirect_to "/favorites/index"
    else

      # BUILD FORM BACK END HERE

    end



        #   @favorite=Favorite.new
    # end

    # @search_results = []
    # Favorite.all.each do 
      # @search_results << Favorite.new

  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
        # if params.has_key?("favorite")
        #   Favorite.create(favorite_params(params["favorite"]))
        # else
        #   params["favorites"].each do |favorite|
        #   Favorite.create(favorite_params(favorite))
        # end
    
        # if @favorite.save
        #   flash[:success] = "Here are your results!"
        #   redirect_to "favorites/display"
        # else
        #   render "/"
        # end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
  

  
  

  private 
  def favorite_params
    params.require(:favorite).permit(:title, :description, :name, :image)

  end
end










