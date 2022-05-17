require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do

  before :each do
    @lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 32, created_at: 3.days.ago)
    @lead_actor_2 = LeadActor.create!(name: "Matt Damon", oscar: true, age: 51, created_at: 1.days.ago)
    @lead_actor_3 = LeadActor.create!(name: "Adam Sandler", oscar: false, age: 55, created_at: 2.days.ago)
  end
  it "displays actors by the time that they were created" do

    visit "/lead_actors"
    # save_and_open_page

    expect(LeadActor.sorted_by_creation.to_a).to eq([@lead_actor_1, @lead_actor_3, @lead_actor_2])
  end
end
