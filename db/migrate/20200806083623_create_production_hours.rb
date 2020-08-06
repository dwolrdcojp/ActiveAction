class CreateProductionHours < ActiveRecord::Migration[6.0]
  def change
    create_table :production_hours do |t|
      t.integer :hour
      t.string :product
      t.float :plan_throughput
      t.float :actual_throughput
      t.float :plan_labor
      t.float :actual_labor
      t.float :downtime
      t.float :waste
      t.float :rework
      t.float :yield
      t.references :production_run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
