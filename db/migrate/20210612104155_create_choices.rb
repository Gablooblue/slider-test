class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.references :choice_test, null: false, foreign_key: true
      t.boolean :answer

      t.timestamps
    end
  end
end
