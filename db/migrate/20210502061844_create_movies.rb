class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string  :title
      t.date    :release_date
      t.integer :runtime
      t.string  :genre
      t.string  :directors
      t.string  :poster
      t.text    :plot
      t.float   :imdbRating

      t.timestamps
    end

    add_index :movies, [:title, :release_date], unique: true
  end
end
