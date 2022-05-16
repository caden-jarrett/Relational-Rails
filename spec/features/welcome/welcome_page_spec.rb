require 'rails_helper'

RSpec.describe 'welcome page/navigation bar', type: :feature do
  it 'displays both movies and lead actor index along with welcome' do

    visit "/"

    expect(page).to have_content("Lead Actors Index")
    expect(page).to have_content("Lead Actors Movies Index")
  end
end
