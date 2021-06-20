class AddRewardedToChoices < ActiveRecord::Migration[6.1]
  def change
    add_column :choices, :rewarded, :boolean, default: false
  end
end
