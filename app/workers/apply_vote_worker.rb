class ApplyVoteWorker
  include Sidekiq::Worker

  def perform(ballot_id)
    ballot = Ballot.find ballot_id
    api = Blockchain::Transactions.new
    api.makeVote(ballot)
  end
end
