require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    # binding.pry
    it { should belong_to :lead_actor }
  end
end
