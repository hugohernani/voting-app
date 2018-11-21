class RemoveDurationFromElection < ActiveRecord::Migration[5.2]
  def change
    remove_column :elections, :duration
  end
end
