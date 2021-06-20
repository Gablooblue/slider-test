class InfoController < ApplicationController
  def show
    @sliders = current_user.slides
    @allocation_tests = current_user.allocation_tests
  end

  def after_show
  end

  def survey
  end

  def results
    @total = current_user.slide_score +
      current_user.choice_tests.count +
      current_user.choice_score + 
      current_user.lottery_score +
      10 + # Survey
      50 #Show Up Fee 

  end

  def instructions
  end

  def users
    @users = User.all 
  end

  def user
    @user = User.find(params[:id])

    @total = @user.slide_score +
      @user.choice_tests.count +
      @user.choice_score + 
      @user.lottery_score +
      10 + # Survey
      50 #Show Up Fee 
  end
end
