class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.all
  end

  def show
    @lead_actor = LeadActor.find(params[:id])
  end

  def children
    @lead_actor = LeadActor.find(params[:id])
    @lead_actor_children = @lead_actor.movies
  end
end
