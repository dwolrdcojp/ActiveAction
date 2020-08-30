class AddAccountToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :account_id, :integer
    add_index  :comments, :account_id
  end
end
