class ElectionsCreateService
  def initialize(election, manager)
    @election = election
    @manager = manager
  end

  def perform
    schedule_election_status_on_blockchain

    election.candidates.each do |candidate|
      notify_candidate(candidate)
    end

    ballot_ids = Array.new
    election.voters.each do |voter|
      ballot = voter.create_vote_resource!
      notify_voter(voter, ballot)
      ballots_ids.push(ballot.id)
    end

    add_election_on_blockchain(ballot_ids, ballot_ids)
    update_blockchain_and_schedule_election_clean_up
  end

  private
  attr_reader :election

  def add_election_on_blockchain(ballot_ids)
    AddElectionThroughBlockchain.perform_async(election.id, manager.id, ballot_ids)
  end

  def update_blockchain_and_schedule_election_clean_up
    ElectionUpdateBlockchainAndCleanUpWorker.perform_async(election.id)
  end

  def schedule_election_status_on_blockchain
    NotifyBlockchainElectionStarted.perform_at(election.start_time, election.id)
    NotifyBlockchainElectionEnded.perform_at(election.end_time, election.id)
  end

  def notify_candidate(candidate)
    CandidateMailer.invite(candidate).deliver_later
  end

  def notify_voter(voter, ballot)
    VoterMailer.invite(election, voter.email, ballot).deliver_later
  end
end