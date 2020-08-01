class RenameActionsToActionItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :actions, :actionitems
  end
end
