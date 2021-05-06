class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @movies = Movie.all
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
