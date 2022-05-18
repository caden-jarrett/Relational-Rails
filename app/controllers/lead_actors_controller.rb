class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.sorted_by_creation
  end

  def new
  end

  def create
    LeadActor.create(lead_actor_params)
    redirect_to "/lead_actors"
  end

  def edit
    @lead_actor = LeadActor.find(params[:id])
  end

  def update
    lead_actor = LeadActor.find(params[:id])
    lead_actor.update(lead_actor_params)
    redirect_to "/lead_actors/#{lead_actor.id}"
  end

  def show
    @lead_actor = LeadActor.find(params[:id])
  end




private
  def lead_actor_params
    params.permit(:name, :oscar, :age)
  end
end
