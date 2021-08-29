class ReliefCampsController < ApplicationController
  before_action :set_relief_camp, only: [:show, :edit, :update, :destroy]

  # GET /relief_camps
  # GET /relief_camps.json
  def index
    @relief_camps = ReliefCamp.all
  end

  # GET /relief_camps/1
  # GET /relief_camps/1.json
  def show
  end

  # GET /relief_camps/new
  def new
    @relief_camp = ReliefCamp.new
  end

  # GET /relief_camps/1/edit
  def edit
  end

  # POST /relief_camps
  # POST /relief_camps.json
  def create
    @relief_camp = ReliefCamp.new(relief_camp_params)

    respond_to do |format|
      if @relief_camp.save
        format.html { redirect_to @relief_camp, notice: 'Relief camp was successfully created.' }
        format.json { render :show, status: :created, location: @relief_camp }
      else
        format.html { render :new }
        format.json { render json: @relief_camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relief_camps/1
  # PATCH/PUT /relief_camps/1.json
  def update
    respond_to do |format|
      if @relief_camp.update(relief_camp_params)
        format.html { redirect_to @relief_camp, notice: 'Relief camp was successfully updated.' }
        format.json { render :show, status: :ok, location: @relief_camp }
      else
        format.html { render :edit }
        format.json { render json: @relief_camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relief_camps/1
  # DELETE /relief_camps/1.json
  def destroy
    @relief_camp.destroy
    respond_to do |format|
      format.html { redirect_to relief_camps_url, notice: 'Relief camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relief_camp
      @relief_camp = ReliefCamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relief_camp_params
      params.require(:relief_camp).permit(:camp_name, :description, :locationId, :admin_name, :phone, :address, :latitude, :longitude)
    end
end
