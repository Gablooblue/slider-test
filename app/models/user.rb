class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :tests
  has_many :slides, through: :tests
  has_many :allocation_tests
  has_many :choice_tests
  has_one :gamble

  def base_slides_count
    11 * 15 #Number of Slides * Number of Screens
  end

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
    if slides_count > base_slides_count
      slides = self.slides.order("created_at DESC").first(slides_count - base_slides_count)
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
      if test.choice_test.present?
        test.choice_test.choices.each do |choice|
          if choice.rewarded
            if choice.answer
              if choice.name.to_i <= test.score
                score += 3
              end
            else
              if choice.lucky
                score +=3
              end
            end
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

  def finished_test_at
    if self.slides.count > base_slides_count
      self.allocation_tests.order("created_at DESC").first.created_at
    else
      if gamble.present?
      self.gamble.created_at
      else
        ""
      end
    end

  end

end
