class NotifyBlockchainElectionEndedWorker
  include Sidekiq::Worker

  def perform(election_id)
    api = Blockchain::Transactions.new
    api.endElection(election_id)
  end
end
