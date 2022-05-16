class LeadActorMoviesController < ApplicationController
  def index
    @lead_actor = LeadActor.find(params[:id])
    @lead_actor_children = @lead_actor.movies
  end
end
