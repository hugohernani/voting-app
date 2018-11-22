class ElectionsCreateService
  def initialize(election)
    @election = election
  end

  def perform
    election.candidates.each do |candidate|
      notify_candidate(candidate)
    end
    election.voters.each do |voter|
      ballot = voter.create_vote_resource!
      notify_voter(voter, ballot)
    end
    schedule_election_clean_up
  end

  private
  attr_reader :election

  def notify_candidate(candidate)
    CandidateMailer.invite(candidate).deliver_later
  end

  def notify_voter(voter, ballot)
    VoterMailer.invite(election, voter.email, ballot).deliver_later
  end

  def schedule_election_clean_up
    ElectionFetchResultWorker.perform_at(election.end_time, election.id)
    ElectionCleanUpWorker.perform_async(election.id)
  end
end
