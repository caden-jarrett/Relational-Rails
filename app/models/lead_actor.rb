class LeadActor < ApplicationRecord
  validates_presence_of :name
  has_many :movies

  def self.sorted_by_creation
    order(created_at: :asc)
  end
end
