class Movie < ApplicationRecord

  def formatted_date
    if self.release_date
      self.release_date.strftime("%d.%m.%Y")
    end
  end
end
