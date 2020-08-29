class AddAccountToProductionRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :production_runs, :account_id, :integer
    add_index  :production_runs, :account_id
  end
end
