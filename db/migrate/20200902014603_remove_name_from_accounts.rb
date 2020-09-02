class RemoveNameFromAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :name, :string
  end
end
