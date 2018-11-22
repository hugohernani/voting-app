class Voter < ApplicationRecord
  validates :email, presence: true

  belongs_to :election,           class_name: "Election",
                                  counter_cache: true

  def create_vote_resource!
    unique_id = loop do
      random_id = SecureRandom.urlsafe_base64(nil, false)
      break random_id unless Ballot.includes(candidate: :election)
                                   .where(id: random_id, elections: {id: election.id}).any?
    end
    Ballot.create(id: unique_id, election: election)
  end
end
