class RootCausesController < ApplicationController
  before_action :set_root_cause, only: [:show, :edit, :update, :destroy]

  # GET /root_causes
  # GET /root_causes.json
  def index
    @root_causes = RootCause.all
  end

  # GET /root_causes/1
  # GET /root_causes/1.json
  def show
  end

  # GET /root_causes/new
  def new
    @root_cause = RootCause.new
  end

  # GET /root_causes/1/edit
  def edit
  end

  # POST /root_causes
  # POST /root_causes.json
  def create
    @root_cause = RootCause.new(root_cause_params)

    respond_to do |format|
      if @root_cause.save
        format.html { redirect_to @root_cause, notice: 'Root cause was successfully created.' }
        format.json { render :show, status: :created, location: @root_cause }
      else
        format.html { render :new }
        format.json { render json: @root_cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /root_causes/1
  # PATCH/PUT /root_causes/1.json
  def update
    respond_to do |format|
      if @root_cause.update(root_cause_params)
        format.html { redirect_to @root_cause, notice: 'Root cause was successfully updated.' }
        format.json { render :show, status: :ok, location: @root_cause }
      else
        format.html { render :edit }
        format.json { render json: @root_cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /root_causes/1
  # DELETE /root_causes/1.json
  def destroy
    @root_cause.destroy
    respond_to do |format|
      format.html { redirect_to root_causes_url, notice: 'Root cause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root_cause
      @root_cause = RootCause.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def root_cause_params
      params.require(:root_cause).permit(:kpi_id, :name, :description)
    end
end
