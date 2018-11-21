class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
