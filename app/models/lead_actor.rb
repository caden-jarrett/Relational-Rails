class LeadActor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates :oscar, inclusion: [true, false]
  # validates :id, prescence: true
  has_many :movies

  def self.sorted_by_creation
    order(created_at: :asc)
  end
end
