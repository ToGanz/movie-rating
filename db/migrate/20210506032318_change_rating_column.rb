class ChangeRatingColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :ratings, :user_rating, :integer, null: false
  end
end
