class AddDefBalCountToElection < ActiveRecord::Migration[5.2]
  def change
    change_column :elections, :ballots_count, :integer, default: 0
  end
end
