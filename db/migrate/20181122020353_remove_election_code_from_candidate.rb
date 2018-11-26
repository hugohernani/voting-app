class RemoveElectionCodeFromCandidate < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidates, :election_code
  end
end
