class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.float :score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
