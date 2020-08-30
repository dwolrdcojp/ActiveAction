class CreateTableDowntimeCriteria < ActiveRecord::Migration[6.0]
  def change
    create_table :downtime_criteria do |t|
      t.string :shift
      t.string :area
      t.string :line
      t.string :equipment
      t.string :reason_code
    end
  end
end
