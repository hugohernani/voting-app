class AddElectionThroughBlockchainWorker
  include Sidekiq::Worker

  def perform(election_id, manager_id, ballot_ids)
    api = Blockchain::Transactions.new
    api.addElection(manager_id, election_id, ballot_ids)
  end
end
