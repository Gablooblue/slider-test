class AddLotteryPointsToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :lottery_points, :integer
  end
end
