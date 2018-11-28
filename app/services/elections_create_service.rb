class ElectionsCreateService
  def initialize(election)
    @election = election
    @manager = election.account
  end

  def perform
    election.candidates.each do |candidate|
      notify_candidate(candidate)
    end

    ballot_ids = Array.new
    election.voters.each do |voter|
      ballot = voter.create_vote_resource!
      notify_voter(voter, ballot)
      ballot_ids.push(ballot.id.to_s)
    end

    add_election_on_blockchain(ballot_ids)
    update_blockchain_and_schedule_election_clean_up
  end

  private
  attr_reader :election, :manager

  def add_election_on_blockchain(ballot_ids)
    AddElectionThroughBlockchainWorker.perform_async(election.id, ballot_ids)
  end

  def update_blockchain_and_schedule_election_clean_up
    ElectionUpdateBlockchainAndCleanUpWorker.perform_async(election.id)
  end

  def notify_candidate(candidate)
    CandidateMailer.invite(candidate).deliver_later
  end

  def notify_voter(voter, ballot)
    VoterMailer.invite(election, voter.email, ballot).deliver_later
  end
end
