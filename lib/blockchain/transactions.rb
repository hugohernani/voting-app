module Blockchain
  class Transactions < ApiHandler
    def initialize
    end

    def startElection
      @api['startElection'].post({
        "$class": "ufal.voting.network.StartElection",
        "election_id": election_id
      })
    end

    def endElection
      @api['endElection'].post({
        "$class": "ufal.voting.network.EndElection",
        "election_id": election_id
      })
    end

    def addElection(manager_id, election, voter_ids)
      @api['createElection'].post({
        "$class": "ufal.voting.network.CreateElection",
        "election_id": election.id,
        "title": election.name,
        "start_time": election.start_time,
        "end_time": election.end_time,
        "allowed_voter_ids": voter_ids,
        "manager_id": manager_id
        })
    end

    def addElectionMembers(election_id, candidates_info, voters)
      @api['createElection'].post({
        "$class": "ufal.voting.network.AddElectionMembers",
        "election_id": election_id,
        "candidates": candidates_info,
        "voter_emails": voters,
      })
    end

    def makeVote(vote)
      @api['makeVote'].post({
        "$class": "ufal.voting.network.MakeVote",
        "voter_id": vote.id,
        "election_id": vote.election.id,
        "candidate_id": vote.candidate.id
      })
    end
  end
end
