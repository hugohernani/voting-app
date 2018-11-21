class AddCountersToElection < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :voters_count, :integer, default: 0
    add_column :elections, :candidates_count, :integer, default: 0
  end
end
