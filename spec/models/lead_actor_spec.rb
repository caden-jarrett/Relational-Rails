require 'rails_helper'

RSpec.describe LeadActor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:oscar) }
    it { should allow_value(false).for(:oscar) }

    # it { should(validate_inclusion_of(:oscar).in_array([true, false]))}
    # Works but raises a warning about testing for booleans
  end

  describe 'relationships' do
    it { should have_many :movies }
  end
end
