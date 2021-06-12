class AddLotteryWonToAllocationTest < ActiveRecord::Migration[6.1]
  def change
    add_column :allocation_tests, :lottery_won, :boolean
  end
end
