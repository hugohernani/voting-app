require 'blockchain/transactions'

class NotifyBlockchainElectionStartedWorker
  include Sidekiq::Worker

  def perform(election_id)
    api = Blockchain::Transactions.new
    api.startElection(election_id)
  end
end
