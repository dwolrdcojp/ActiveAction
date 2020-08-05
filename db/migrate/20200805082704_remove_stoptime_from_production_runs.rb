class RemoveStoptimeFromProductionRuns < ActiveRecord::Migration[6.0]
  def change
    remove_column :production_runs, :stoptime, :time
  end
end
