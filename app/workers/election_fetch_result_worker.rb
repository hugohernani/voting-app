class ElectionFetchResultWorker
  include Sidekiq::Worker

  def perform(election_id)
    election = Election.find(election_id)
    ElectionFetchResultService.new(election).perform
    election.reload
  end
end
