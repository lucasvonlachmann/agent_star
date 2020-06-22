class KpiTypesController < ApplicationController
  before_action :set_kpi_type, only: [:show, :edit, :update, :destroy]

  # GET /kpi_types
  # GET /kpi_types.json
  def index
    @kpi_types = KpiType.all
  end

  # GET /kpi_types/1
  # GET /kpi_types/1.json
  def show
  end

  # GET /kpi_types/new
  def new
    @kpi_type = KpiType.new
  end

  # GET /kpi_types/1/edit
  def edit
  end

  # POST /kpi_types
  # POST /kpi_types.json
  def create
    @kpi_type = KpiType.new(kpi_type_params)

    respond_to do |format|
      if @kpi_type.save
        format.html { redirect_to @kpi_type, notice: 'Kpi type was successfully created.' }
        format.json { render :show, status: :created, location: @kpi_type }
      else
        format.html { render :new }
        format.json { render json: @kpi_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpi_types/1
  # PATCH/PUT /kpi_types/1.json
  def update
    respond_to do |format|
      if @kpi_type.update(kpi_type_params)
        format.html { redirect_to @kpi_type, notice: 'Kpi type was successfully updated.' }
        format.json { render :show, status: :ok, location: @kpi_type }
      else
        format.html { render :edit }
        format.json { render json: @kpi_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpi_types/1
  # DELETE /kpi_types/1.json
  def destroy
    @kpi_type.destroy
    respond_to do |format|
      format.html { redirect_to kpi_types_url, notice: 'Kpi type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpi_type
      @kpi_type = KpiType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kpi_type_params
      params.require(:kpi_type).permit(:name, :vw_name)
    end
end
