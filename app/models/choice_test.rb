class ChoiceTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  has_many :choices

  accepts_nested_attributes_for :choices
end
