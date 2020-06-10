class ChecklistRootCausesController < ApplicationController
  before_action :set_checklist_root_cause, only: [:show, :edit, :update, :destroy]

  # GET /checklist_root_causes
  # GET /checklist_root_causes.json
  def index
    @checklist_root_causes = ChecklistRootCause.all
  end

  # GET /checklist_root_causes/1
  # GET /checklist_root_causes/1.json
  def show
  end

  # GET /checklist_root_causes/new
  def new
    @checklist_root_cause = ChecklistRootCause.new
  end

  # GET /checklist_root_causes/1/edit
  def edit
  end

  # POST /checklist_root_causes
  # POST /checklist_root_causes.json
  def create
    @checklist_root_cause = ChecklistRootCause.new(checklist_root_cause_params)

    respond_to do |format|
      if @checklist_root_cause.save
        format.html { redirect_to @checklist_root_cause, notice: 'Checklist root cause was successfully created.' }
        format.json { render :show, status: :created, location: @checklist_root_cause }
      else
        format.html { render :new }
        format.json { render json: @checklist_root_cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_root_causes/1
  # PATCH/PUT /checklist_root_causes/1.json
  def update
    respond_to do |format|
      if @checklist_root_cause.update(checklist_root_cause_params)
        format.html { redirect_to @checklist_root_cause, notice: 'Checklist root cause was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist_root_cause }
      else
        format.html { render :edit }
        format.json { render json: @checklist_root_cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_root_causes/1
  # DELETE /checklist_root_causes/1.json
  def destroy
    @checklist_root_cause.destroy
    respond_to do |format|
      format.html { redirect_to checklist_root_causes_url, notice: 'Checklist root cause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_root_cause
      @checklist_root_cause = ChecklistRootCause.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checklist_root_cause_params
      params.require(:checklist_root_cause).permit(:checklist_id, :root_cause_id)
    end
end
