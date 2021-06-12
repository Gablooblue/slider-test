class ChoiceTestsController < ApplicationController
  before_action :set_choice_test, only: %i[ show edit update destroy ]

  # GET /choice_tests or /choice_tests.json
  def index
    @choice_tests = ChoiceTest.all
  end

  # GET /choice_tests/1 or /choice_tests/1.json
  def show
  end

  # GET /choice_tests/new
  def new
    @choice_test = ChoiceTest.new
    11.times {@choice_test.choices.build}
  end

  # GET /choice_tests/1/edit
  def edit
  end

  # POST /choice_tests or /choice_tests.json
  def create
    @choice_test = ChoiceTest.new(choice_test_params)
    if current_user.tests.count.between?(0,19)
      redirect_path = new_test_path
    elsif current_user.tests.count == 20
      redirect_path = new_allocation_test_path
    else
      redirect_path = after_test_show_path
    end

    respond_to do |format|
      if @choice_test.save
        format.html { redirect_to redirect_path, notice: "Choice test was successfully created." }
        format.json { render :show, status: :created, location: @choice_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @choice_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choice_tests/1 or /choice_tests/1.json
  def update
    respond_to do |format|
      if @choice_test.update(choice_test_params)
        format.html { redirect_to @choice_test, notice: "Choice test was successfully updated." }
        format.json { render :show, status: :ok, location: @choice_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @choice_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choice_tests/1 or /choice_tests/1.json
  def destroy
    @choice_test.destroy
    respond_to do |format|
      format.html { redirect_to choice_tests_url, notice: "Choice test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choice_test
      @choice_test = ChoiceTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def choice_test_params
      params.require(:choice_test).permit(:test_id, :user_id, choice_attributes: [:id, :choice_test_id, :answer, :name])
    end
end
