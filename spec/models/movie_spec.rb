require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:over_two_hours) }
    it { should allow_value(false).for(:over_two_hours) }
  end

  describe 'relationships' do
    it { should belong_to :lead_actor }
  end
end
