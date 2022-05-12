class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.all
  end

  def show
    @lead_actors = LeadActor.find(params[:id])
  end
end
