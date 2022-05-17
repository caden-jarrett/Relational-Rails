class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.sorted_by_creation
  end

  def show
    @lead_actor = LeadActor.find(params[:id])
  end
end
