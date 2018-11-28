require 'blockchain/transactions'

class ElectionUpdateBlockchainAndCleanUpWorker
  include Sidekiq::Worker

  def perform(election_id)
    election = Election.find election_id
    candidates_info = election.candidates.collect do |c|
      Hash[:class, "ufal.voting.network.CandidateInfo", :id, c.id.to_s, :name, c.name]
    end
    voters_emails = election.voters.pluck(:email)
    election.voters.destroy_all # The client instance does not need this anymore

    api = Blockchain::Transactions.new
    api.addElectionMembers(election_id, candidates_info, voters_emails)
  end
end
