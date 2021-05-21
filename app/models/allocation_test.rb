class AllocationTest < ApplicationRecord
  belongs_to :test
  belongs_to :user

  has_many :allocation_items
  accepts_nested_attributes_for :allocation_items
end
