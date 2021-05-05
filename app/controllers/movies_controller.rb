class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

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
  end

end
