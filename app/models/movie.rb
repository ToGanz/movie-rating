class Movie < ApplicationRecord
  has_many :ratings
  has_many :rating_users, through: :ratings

  def formatted_date
    if self.release_date
      self.release_date.strftime("%d.%m.%Y")
    end
  end
end
