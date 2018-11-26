class AddVotedToBallot < ActiveRecord::Migration[5.2]
  def change
    add_column :ballots, :voted, :boolean, default: false
  end
end
