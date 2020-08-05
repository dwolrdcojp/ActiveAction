class RemoveStarttimeFromProductionRuns < ActiveRecord::Migration[6.0]
  def change
    remove_column :production_runs, :starttime, :time
  end
end
