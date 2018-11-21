class Voter < ApplicationRecord
  validates :email, presence: true

  belongs_to :election,           class_name: "Election",
                                  counter_cache: true
end
