class CreateBallots < ActiveRecord::Migration[5.2]
  def change
    create_table :ballots, id: false do |t|
      t.string :id, null: false
      t.references :candidate, foreign_key: true, index: true

      t.timestamps
    end

    add_index :ballots, :id, unique: true
  end
end
