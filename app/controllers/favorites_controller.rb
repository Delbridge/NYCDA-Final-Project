class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

  end

  def calendar
    require 'date'
    if !current_user
      redirect_to "/favorites/landing"
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


    if @search_results
      @many_returned = @search_results.length
      @form_submissions = []

      @many_returned.times do
        @form_submissions.push(Favorite.new)
      end
    end

  end

  def create
    params[:number_of_submits].to_i.times do |i|
        if params["wanted"+i.to_s] == "true"
         @favorite = Favorite.new
         @favorite.title = params["title"+i.to_s].split(",")
         @favorite.name = params["name"+i.to_s]
         @favorite.image = params["image"+i.to_s]
         @favorite.description = params["description"+i.to_s]
         @favorite.user_id = current_user.id
            if @favorite.save
              flash[:success] = "Here are your results!"
              # redirect_to "/favorite/#{@favorite.id}"
            else
              # redirect_to "/"
            end
        end
    end
    redirect_to "/favorites/index"
  end



  def show


    @favorite = Favorite.find(params[:id])



    @titles = []
    @favorite.title.each do |item|
      if @titles.include?(item)
      else
        @titles.push(item)
      end
    end
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
  def favorite_params(my_params)
    params.require(:favorite).permit(:title, :description, :name, :image, :user_id)

  end
end
