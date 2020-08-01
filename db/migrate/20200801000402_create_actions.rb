class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :focus
      t.text :description
      t.string :owner
      t.date :due
      t.text :resources
      t.string :urgency
      t.string :importance
      t.string :status
      t.text :updates
      t.date :completion

      t.timestamps
    end
  end
end
