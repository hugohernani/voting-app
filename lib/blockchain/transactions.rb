require 'blockchain/api_handler'

module Blockchain
  class Transactions < ApiHandler
    def initialize
      super()
    end

    def createManager(account)
      @api['Manager'].post(
        "$class": "ufal.voting.network.Manager",
        "manager_id": account.id.to_s,
        "email": account.email
      })
    end

    def startElection(election_id)
      @api['StartElection'].post({
        "$class": "ufal.voting.network.StartElection",
        "election_id": election_id.to_s
      }.to_json)
    end

    def endElection(election_id)
      @api['EndElection'].post({
        "$class": "ufal.voting.network.EndElection",
        "election_id": election_id.to_s
      }.to_json)
    end

    def addElection(election, voter_ids)
      @api['CreateElection'].post({
        "$class": "ufal.voting.network.CreateElection",
        "election_id": election.id.to_s,
        "title": election.name,
        "start_time": election.start_time.to_s,
        "end_time": election.end_time.to_s,
        "allowed_voter_ids": voter_ids,
        "manager_id": election.account_id.to_s
      }.to_json)
    end

    def addElectionMembers(election_id, candidates_info, voters)
      @api['createElection'].post({
        "$class": "ufal.voting.network.AddElectionMembers",
        "election_id": election_id.to_s,
        "candidates": candidates_info,
        "voter_emails": voters,
      }.to_json)
    end

    def makeVote(vote)
      @api['MakeVote'].post({
        "$class": "ufal.voting.network.MakeVote",
        "voter_id": vote.id.to_s,
        "election_id": vote.election.id.to_s,
        "candidate_id": vote.candidate.id.to_s
      }.to_json)
    end
  end
end
