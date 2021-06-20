class AddLuckyToChoices < ActiveRecord::Migration[6.1]
  def change
    add_column :choices, :lucky, :boolean, default: false
  end
end
