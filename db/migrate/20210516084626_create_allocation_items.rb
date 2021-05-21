class CreateAllocationItems < ActiveRecord::Migration[6.1]
  def change
    create_table :allocation_items do |t|
      t.references :allocation_test, null: false, foreign_key: true
      t.string :name
      t.integer :points

      t.timestamps
    end
  end
end
