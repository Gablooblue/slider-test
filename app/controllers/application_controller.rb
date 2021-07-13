class ApplicationController < ActionController::Base
  def slides_per_screen
    return 11
  end

  def number_of_screens
    return 15
  end

  def base_slides_count
    return slides_per_screen * number_of_screens
  end
end
