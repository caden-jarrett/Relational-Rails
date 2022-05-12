class LeadActorsController < ApplicationController
  def index
    @lead_actors = LeadActor.all
  end

  def show
  end
end
