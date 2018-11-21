class CreateVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :voters do |t|
      t.string :email
      t.references :election, foreign_key: true, index: true

      t.timestamps
    end
  end
end
