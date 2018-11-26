class AddAcceptedVotersToElection < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :ballots_count, :integer
  end
end
