class AddAccountToActionitems < ActiveRecord::Migration[6.0]
  def change
    add_column :actionitems, :account_id, :integer
    add_index  :actionitems, :account_id
  end
end
