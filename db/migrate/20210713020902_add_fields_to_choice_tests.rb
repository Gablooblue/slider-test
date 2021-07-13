class AddFieldsToChoiceTests < ActiveRecord::Migration[6.1]
  def change
    add_column :choice_tests, :correct_slides, :integer
    add_column :choice_tests, :gamble, :integer
  end
end
