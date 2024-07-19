class CreateOutdoorSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :outdoor_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.float :duration
      t.text :description

      t.timestamps
    end
  end
end
