class ElectionCleanUpWorker
  include Sidekiq::Worker

  def perform(election_id)
    election = Election.find election_id
    election.voters.destroy_all # Voters emails is not needed anymore.
  end
end
