class Candidate < ApplicationRecord
  # Validations
  validates :name, :email, presence: true

  # Associations
  belongs_to :election,         class_name: "Election",
                                counter_cache: true,
                                required: true

  # Delegations
  delegate :name, :start_time, :end_time, :has_ended?, :has_started?,
           :running?, to: :election, prefix: true, allow_nil: true

  def accepted_election_invitation!
    update_column :accepted_election_invitation, true
  end
end
