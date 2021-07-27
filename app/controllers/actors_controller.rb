class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({ :template => "actors_templates/index.html.erb"})
  end

  def actor_details
    @actor_id = params.fetch("actor_id")
    @list_of_actors = Actor.all
    @the_actor = Actor.where({:id => @actor_id}).at(0)

    # @list_of_characters = Character.all
    # @the_character = Character.where({:actor_id => @actor_id}).at(0)

    # @list_of_movies = Movie.all
    # @the_movie = Movie.where({:id => @the_character.movie_id}).at(0)

    # @list_of_directors = Director.all
    # @the_director = Director.where({:id => @the_movie.director_id}).at(0)

    @characters = Character.where({:actor_id => @actor_id})
    @character_names = Character.where({:actor_id => @actor_id}).map_relation_to_array(:name)
    @movie_id = Character.where({:actor_id => @actor_id}).map_relation_to_array(:movie_id)
    @movie_names = Movie.where({:id => @movie_id}).map_relation_to_array(:title)
    @director_id = Movie.where({:id => @movie_id}).map_relation_to_array(:director_id)
    @director_names = Director.where({:id => @director_id}).map_relation_to_array(:name)
    @years = Movie.where({:id => @movie_id}).map_relation_to_array(:year)
    
    render({ :template => "actors_templates/show_actors.html.erb"})
  end
end