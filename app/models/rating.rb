class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_rating, presence: true
end
