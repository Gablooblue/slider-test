class Test < ApplicationRecord
  belongs_to :user
  has_many :slides

  accepts_nested_attributes_for :slides
end
