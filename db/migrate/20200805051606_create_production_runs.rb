class CreateProductionRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :production_runs do |t|
      t.date :date
      t.string :line
      t.string :shift
      t.string :supervisor
      t.string :lead
      t.string :operator
      t.time :starttime
      t.time :stoptime

      t.timestamps
    end
  end
end
