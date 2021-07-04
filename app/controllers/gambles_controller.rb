class GamblesController < ApplicationController
  before_action :set_gamble, only: %i[ show edit update destroy ]

  # GET /gambles or /gambles.json
  def index
    @gambles = Gamble.all
  end

  # GET /gambles/1 or /gambles/1.json
  def show
  end

  # GET /gambles/new
  def new
    @gamble = Gamble.new
  end

  # GET /gambles/1/edit
  def edit
  end

  # POST /gambles or /gambles.json
  def create
    @gamble = Gamble.new(gamble_params)

    respond_to do |format|
      if @gamble.save
        format.html { redirect_to info_show_path }
        format.json { render :show, status: :created, location: @gamble }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gamble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gambles/1 or /gambles/1.json
  def update
    respond_to do |format|
      if @gamble.update(gamble_params)
        format.html { redirect_to @gamble, notice: "Gamble was successfully updated." }
        format.json { render :show, status: :ok, location: @gamble }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gamble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gambles/1 or /gambles/1.json
  def destroy
    @gamble.destroy
    respond_to do |format|
      format.html { redirect_to gambles_url, notice: "Gamble was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamble
      @gamble = Gamble.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gamble_params
      params.require(:gamble).permit(:user_id, :points)
    end
end
