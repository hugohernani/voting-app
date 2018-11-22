class Election < ApplicationRecord
  validates :name, :start_time, :end_time, presence: true

  has_many :candidates,             class_name: "Candidate",
                                    dependent: :destroy
  has_many :voters,                 class_name: "Voter",
                                    dependent: :destroy

  accepts_nested_attributes_for :candidates, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :voters, reject_if: :all_blank, allow_destroy: true

  def has_started?
    self.start_time < Time.now
  end

  def has_ended?
    self.end_time < Time.now
  end

  def running?
    self.has_started? && !self.has_ended?
  end

  def is_the_winner?(candidate)
    candidates.order(votes_count: :desc).first&.name == candidate.name
  end
end
