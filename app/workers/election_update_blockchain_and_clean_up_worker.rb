require 'blockchain/transactions'

class ElectionUpdateBlockchainAndCleanUpWorker
  include Sidekiq::Worker

  def perform(election_id)
    election = Election.find election_id
    candidates_info = election.candidates.collect{|c| Hash[[:id, c.id.to_s], [:name, c.name]] }
    voters_emails = election.voters.pluck(:email)
    api = Blockchain::Transactions.new
    api.addElectionMembers(election_id, candidates_info, voters_emails)
    election.voters.destroy_all # The client id does not need this anymore
  end
end
