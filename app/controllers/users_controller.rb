class UsersController < ApplicationController
  def index
    @users = User.left_outer_joins(:ratings).group('users.id').order("count(ratings.id) DESC")
  end

  def show
    @user = User.find(params[:id])
    @ratings = @user.ratings.order(user_rating: :desc)
  end
end
