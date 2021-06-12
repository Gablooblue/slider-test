class Test < ApplicationRecord
  belongs_to :user
  has_many :slides
  has_one :choice_test

  accepts_nested_attributes_for :slides

  def score
    points = 0
    self.slides.each do |slide|
      if slide.score >= 49.5 and slide.score <= 50.5
        points += 1
      end
    end
    points
  end
end
