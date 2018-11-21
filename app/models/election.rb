class Election < ApplicationRecord
  validates :name, :start_time, :end_time, presence: true

  has_many :candidates,             class_name: "Candidate",
                                    dependent: :destroy
  has_many :voters,                 class_name: "Voter",
                                    dependent: :destroy
                                    
  accepts_nested_attributes_for :candidates, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :voters, reject_if: :all_blank, allow_destroy: true
end
