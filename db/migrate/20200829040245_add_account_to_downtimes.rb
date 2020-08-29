class AddAccountToDowntimes < ActiveRecord::Migration[6.0]
  def change
    add_column :downtimes, :account_id, :integer
    add_index  :downtimes, :account_id
  end
end
