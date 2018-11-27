require 'blockchain/api_handler'

module Blockchain
  class Transactions < ApiHandler
    def initialize
      super()
    end

    def startElection(election_id)
      @api['startElection'].post({
        "$class": "ufal.voting.network.StartElection",
        "election_id": election_id
      }.to_json)
    end

    def endElection(election_id)
      @api['endElection'].post({
        "$class": "ufal.voting.network.EndElection",
        "election_id": election_id
      }.to_json)
    end

    def addElection(election, voter_ids)
      @api['createElection'].post({
        "$class": "ufal.voting.network.CreateElection",
        "election_id": election.id,
        "title": election.name,
        "start_time": election.start_time,
        "end_time": election.end_time,
        "allowed_voter_ids": voter_ids,
        "manager_id": election.account_id
      }.to_json)
    end

    def addElectionMembers(election_id, candidates_info, voters)
      @api['createElection'].post({
        "$class": "ufal.voting.network.AddElectionMembers",
        "election_id": election_id,
        "candidates": candidates_info,
        "voter_emails": voters,
      }.to_json)
    end

    def makeVote(vote)
      @api['makeVote'].post({
        "$class": "ufal.voting.network.MakeVote",
        "voter_id": vote.id,
        "election_id": vote.election.id,
        "candidate_id": vote.candidate.id
      }.to_json)
    end
  end
end
