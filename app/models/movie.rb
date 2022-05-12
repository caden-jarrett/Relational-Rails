class Movie < ApplicationRecord
belongs_to :lead_actor, dependent: :destroy
end
