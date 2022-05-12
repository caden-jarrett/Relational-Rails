class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.all
  end

  def show
    @lead_actor = LeadActor.find(params[:id])
  end
end
