class AddAcceptAttrToCandadte < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :accepted_election_invitation, :boolean, default: false
  end
end
