class AddUserRatingToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :user_rating, :float
  end
end
