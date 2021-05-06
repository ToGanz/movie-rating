class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    if user_signed_in?
      @movies = current_user.rated_movies
    else
      @movies = Movie.all
    end
  end

  def create
    title = params[:title]
    @movie, error = OmdbService.find_or_create_from_api(title)
  
    if !error
      redirect_to @movie
    else
      flash[:warning] = "Could not find the entered movie."
      redirect_to root_path
    end
  end

  def show
    @movie = Movie.find(params[:id])
    if current_user && @movie.rated_by_user?(current_user)
      @rating = @movie.rating_by_user(current_user)
    else
      @rating = Rating.new
    end
  end


end
