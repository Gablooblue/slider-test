class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :tests
  has_many :slides, through: :tests
  has_many :allocation_tests
  has_many :choice_tests

  def slide_score
    points = 0
    self.slides.each do |slide|
      if slide.score >= 49.5 and slide.score <= 50.5
        points += 1
      end
    end
    points
  end

  def current_slide_score
    points = 0
    slides_count = self.slides.count
    if slides_count > 220
      slides = self.slides.order("created_at DESC").first(slides_count - 220)
    else
      slides = self.slides
    end
    slides.each do |slide|
      if slide.score >= 49.5 and slide.score <= 50.5
        points += 1
      end
    end
    points
  end

  def last_test
    self.tests.order("created_at DESC").first
  end

  def choice_score
    score = 0

    self.tests.each do |test|
      test.choice_test.choices.each do |choice|
        if choice.answer
          if choice.name.to_i <= test.score
            score += 3
          end
        else
          if rand.round == 0 
            score +=3
          end
        end
      end
    end

    score

  end

  def lottery_score
    points = 0
    self.allocation_tests.each do |at|
      if at.lottery_won 
        points += 50
      end
    end
    points
  end

end
