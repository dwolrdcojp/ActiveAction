class AddAccountToDowntimeCriteria < ActiveRecord::Migration[6.0]
  def change
    add_column :downtime_criteria, :account_id, :integer
    add_index  :downtime_criteria, :account_id
  end
end
