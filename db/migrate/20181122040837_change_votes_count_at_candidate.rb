class ChangeVotesCountAtCandidate < ActiveRecord::Migration[5.2]
  def change
    change_column :candidates, :votes_count, :integer, default: 0
  end
end
