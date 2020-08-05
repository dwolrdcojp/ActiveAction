class AddStartTimeToProductionRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :production_runs, :start_time, :string
  end
end
