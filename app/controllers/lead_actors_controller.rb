class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.sorted_by_creation
  end

  def show
    @lead_actor = LeadActor.find(params[:id])
  end

  def new
  end

  def create
    LeadActor.create(lead_actor_params)
    binding.pry 
    redirect_to "/lead_actors"
  end

private
  def lead_actor_params
    params.permit(:id, :name, :oscar, :age, :datetime)
  end
end
