class Candidate < ApplicationRecord
  validates :name, :email, presence: true

  belongs_to :election,         class_name: "Election",
                                counter_cache: true
end
