require 'blockchain/transactions'

class RegisterManagerOnBlockchainWorker
  include Sidekiq::Worker

  def perform(account_id)
    account = Account.find account_id
    api = Blockchain::Transactions.new
    api.createManager(account)
  end
end
