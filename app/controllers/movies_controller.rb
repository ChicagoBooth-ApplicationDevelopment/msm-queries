class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
    @director_id = @list_of

    render ({ :template => "movies_templates/index.html.erb"})
  end

  # def director_name
  #   @list_of_directors = Director.all
  #   @list_of_movies = Movie.all
  #   @director_name = @list_of_directors.where(@list_of_directors.id == @list_of_movies.director_id).name
  # end

  def movies_details
    @movie_id = params.fetch("movie_id")
    @the_movie = Movie.where({:id => @movie_id}).at(0)
    #@director_name = Director.where({:id => @the_movie.director_id}).map_relation_to_array(:name)
    @director_name = Director.where({:id => @the_movie.director_id}).at(0).name

    render({ :template => "movies_templates/show_movies.html.erb"})
  end
end