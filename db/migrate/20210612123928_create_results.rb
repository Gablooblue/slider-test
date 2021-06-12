class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :total
      t.integer :choices_accomplished
      t.integer :choice_score
      t.integer :sliders_accomplished
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
