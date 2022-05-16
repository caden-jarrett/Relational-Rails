class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.all
    @sorted_lead_actors = @lead_actors.order(created_at: :desc)
  end

  def show
    @lead_actor = LeadActor.find(params[:id])
  end
end
