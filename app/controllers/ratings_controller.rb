class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    rating = current_user.ratings.build(rating_params)
    if rating.save
      flash[:notice] = "Rating saved."
    end
    redirect_to movie_path(rating_params[:movie_id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to movie_path(rating_params[:movie_id])
    else
      render 'movie/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_rating, :movie_id)
  end
end
