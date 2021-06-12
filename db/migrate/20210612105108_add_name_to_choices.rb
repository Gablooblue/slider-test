class AddNameToChoices < ActiveRecord::Migration[6.1]
  def change
    add_column :choices, :name, :string
  end
end
