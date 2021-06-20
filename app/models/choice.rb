class Choice < ApplicationRecord
  belongs_to :choice_test
  before_save :test_luck

  def test_luck
    if not self.answer 
      if rand.round == 0 
        self.lucky = true
      end
    end
  end

  def possible_points
    if self.answer
      if self.name.to_i <= self.choice_test.test.score
        return 3
      else 
        return 0
      end
    else
      if lucky
        return 3
      else
        return 0
      end
    end
  end
end
