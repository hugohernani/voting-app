require 'blockchain/transactions'

class AddElectionThroughBlockchainWorker
  include Sidekiq::Worker

  def perform(election_id, ballot_ids)
    election = Election.find election_id
    api = Blockchain::Transactions.new
    api.addElection(election, ballot_ids)
  end
end
