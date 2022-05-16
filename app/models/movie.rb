class Movie < ApplicationRecord
  validates_presence_of :name
  belongs_to :lead_actor, dependent: :destroy
end
