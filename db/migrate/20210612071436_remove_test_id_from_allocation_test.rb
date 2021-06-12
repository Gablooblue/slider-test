class RemoveTestIdFromAllocationTest < ActiveRecord::Migration[6.1]
  def change
    remove_reference :allocation_tests, :test, null: false, foreign_key: true
  end
end
