class AddElectionToBallot < ActiveRecord::Migration[5.2]
  def change
    add_reference :ballots, :election, foreign_key: true
  end
end
