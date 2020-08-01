class AddPriorityToActionitems < ActiveRecord::Migration[6.0]
  def change
    add_column :actionitems, :priority, :string
  end
end
