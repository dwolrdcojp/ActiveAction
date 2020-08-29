class AddAccountToProductionHours < ActiveRecord::Migration[6.0]
  def change
    add_column :production_hours, :account_id, :integer
    add_index  :production_hours, :account_id
  end
end
