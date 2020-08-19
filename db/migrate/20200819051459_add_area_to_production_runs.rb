class AddAreaToProductionRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :production_runs, :area, :string
  end
end
