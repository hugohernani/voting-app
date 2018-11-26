class AddAccountToElection < ActiveRecord::Migration[5.2]
  def change
    add_reference :elections, :account, foreign_key: true
  end
end
