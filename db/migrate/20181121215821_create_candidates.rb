class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :votes_count
      t.references :election, foreign_key: true, index: true

      t.timestamps
    end
  end
end
