class AddStopTimeToProductionRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :production_runs, :stop_time, :string
  end
end
