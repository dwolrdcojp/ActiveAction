class CreateDowntimes < ActiveRecord::Migration[6.0]
  def change
    create_table :downtimes do |t|
      t.date :date
      t.string :shift
      t.string :area
      t.string :line
      t.string :equipment
      t.string :start_time
      t.string :stop_time
      t.integer :downtime
      t.string :reason_code
      t.string :comment

      t.timestamps
    end
  end
end
