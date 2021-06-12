class AllocationTest < ApplicationRecord
  belongs_to :user

  has_many :allocation_items
  accepts_nested_attributes_for :allocation_items

  before_save :check_lottery

  def sorted_allocation_items
    self.allocation_items.order("name ASC")
  end

  def check_lottery
    y = 0
    correct_sliders = self.user.current_slide_score
    allocation_items.each do |j|
      y += (j.points - (j.get_range.include?(correct_sliders) ? 100 : 0)) ** 2
    end

    if y < rand(20000) 
      self.lottery_won = true
    else
      self.lottery_won = false
    end

  end
end
