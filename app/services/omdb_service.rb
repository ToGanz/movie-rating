class OmdbService

  def self.find_or_create_from_api(title)
    response = self.get_movie_by_title(title)
    movie = nil
    if !response["Error"]
      movie = Movie.find_or_create_by(
        title: response["Title"], 
        release_date: response["Released"],
        runtime: response["Runtime"], 
        genre: response["Genre"], 
        directors: response["Director"],
        poster: response["Poster"],
        plot: response["Plot"],
        imdbRating: response["imdbRating"]
      )
    end
    [ movie, response["Error"]]
  end
  private

  def self.get_movie_by_title(title)
    response = HTTParty.get(BASE_URL + "#{title}" + API_PARTIAL_URL)
  end

  BASE_URL = "http://www.omdbapi.com/?t="  
  API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 
end