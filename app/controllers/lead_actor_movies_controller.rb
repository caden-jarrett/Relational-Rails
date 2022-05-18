class LeadActorMoviesController < ApplicationController
  def index
    @lead_actor = LeadActor.find(params[:id])
    @lead_actor_children = @lead_actor.movies
  end

  def new
    @lead_actor = LeadActor.find(params[:id])
  end

  def create
    lead_actor = LeadActor.find(params[:id])
    lead_actor.movies.create(movie_params)
    redirect_to "/movies"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to "/movies/#{movie.id}"
  end

private
  def movie_params
    params.permit(:name, :rating, :over_two_hours)
  end
end
