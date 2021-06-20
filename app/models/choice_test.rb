class ChoiceTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  has_many :choices

  accepts_nested_attributes_for :choices

  after_save :pick_rewarded

  def pick_rewarded
    r = rand(11)
    puts r
    choice = self.choices.first(r).last
    choice.rewarded = true
    choice.save
  end
end
