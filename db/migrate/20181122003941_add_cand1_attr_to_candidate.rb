class AddCand1AttrToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :election_code, :string
  end
end
