class AllocationTestsController < ApplicationController
  before_action :set_allocation_test, only: %i[ show edit update destroy ]

  # GET /allocation_tests or /allocation_tests.json
  def index
    @allocation_tests = AllocationTest.all
  end

  # GET /allocation_tests/1 or /allocation_tests/1.json
  def show
  end

  # GET /allocation_tests/new
  def new
    @allocation_test = AllocationTest.new
    11.times {@allocation_test.allocation_items.build}
    if current_user.slides.count <= 220
      @slide_count = current_user.slides.count
    else
      @slide_count = current_user.slides.count - 220
    end


  end

  # GET /allocation_tests/1/edit
  def edit
  end

  # POST /allocation_tests or /allocation_tests.json
  def create
    @allocation_test = AllocationTest.new(allocation_test_params)
    redirect_path = nil
    if not current_user.allocation_tests.any?
      redirect_path = new_gamble_path
    else
      redirect_path = survey_path
    end

    respond_to do |format|
      if @allocation_test.save
        format.html { redirect_to redirect_path}
        format.json { render :show, status: :created, location: @allocation_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @allocation_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allocation_tests/1 or /allocation_tests/1.json
  def update
    respond_to do |format|
      if @allocation_test.update(allocation_test_params)
        format.html { redirect_to @allocation_test, notice: "Allocation test was successfully updated." }
        format.json { render :show, status: :ok, location: @allocation_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @allocation_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allocation_tests/1 or /allocation_tests/1.json
  def destroy
    @allocation_test.destroy
    respond_to do |format|
      format.html { redirect_to allocation_tests_url, notice: "Allocation test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allocation_test
      @allocation_test = AllocationTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allocation_test_params
      params.require(:allocation_test).permit(:test_id, :user_id,
                                             allocation_items_attributes: [:name, :points, :allocation_test_id])
    end
end
