class Movie < ApplicationRecord
  has_many :ratings
  has_many :rating_users, through: :ratings, source: :user

  def formatted_date
    if self.release_date
      self.release_date.strftime("%d.%m.%Y")
    end
  end

  def rated_by_user?(user)
    rating_users.include?(user)
  end

  def rating_by_user(user)
    if rated_by_user?(user)
      user.ratings.find_by(movie_id: id)
    else
      nil
    end
  end

  def average_rating
    length = 0
    sum = ratings.inject(0) do |sum, rating|
      length += 1
      sum + rating.user_rating
    end
    (sum / length.to_f).round(1)
  end
end
