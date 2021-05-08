# Movie-rating

Movie-rating app in Ruby on Rails.
* Ruby version: 3.0.1

* Rails: 6.1.3.1

Live Site: [https://tg-movie-rating.herokuapp.com]
(free plan so first load might take a few seconds)

In this app you can search and rate your favorite movies. Ratings can be compared with other users and an avg rating for each movie is displayed.


![image](https://user-images.githubusercontent.com/49613341/117522827-b07f3480-afb5-11eb-9941-edc8166276d8.png)



I build this app to practice authentication with devise and to practice making external API calls within rails.

Technologies used: 
* Ruby on Rails
* postgresql
* Bootstrap
* RSpec/Capybara for tests
* Devise for authentication
* SendGrid for Email

### User Authentication functionality:
Users register with a name, email and password. Information can be edited and deleted. If a user forgets his password he can recover it via email.

### Search functionality:
After entering a movie title an API call is made to the OMDB API to get additional information and the movie poster. After that the information gets saved to the database if the movie is not already present in the database. This is done via the "find_or_create_by" method:
```ruby
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
```


## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install 
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```