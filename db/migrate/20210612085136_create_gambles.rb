class CreateGambles < ActiveRecord::Migration[6.1]
  def change
    create_table :gambles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
