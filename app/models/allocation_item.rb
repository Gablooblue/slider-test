class AllocationItem < ApplicationRecord
  belongs_to :allocation_test

  def get_range
    parsed = self.name.split("-")
    range = parsed[0]..parsed[1]
    range
  end

end
