class Movie < ApplicationRecord
  validates_presence_of :name
  validates :over_two_hours, inclusion: [true, false]
  belongs_to :lead_actor, dependent: :destroy
end
