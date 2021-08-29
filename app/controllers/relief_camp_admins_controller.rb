class ReliefCampAdminsController < ApplicationController
  before_action :set_relief_camp_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_super_admin!

  # GET /relief_camp_admins
  # GET /relief_camp_admins.json
  def index
    @relief_camp_admins = ReliefCampAdmin.all
  end

  # GET /relief_camp_admins/1
  # GET /relief_camp_admins/1.json
  def show
  end

  # GET /relief_camp_admins/new
  def new
    @relief_camp_admin = ReliefCampAdmin.new
  end

  # GET /relief_camp_admins/1/edit
  def edit
  end

  # POST /relief_camp_admins
  # POST /relief_camp_admins.json
  def create
    @relief_camp_admin = ReliefCampAdmin.new(relief_camp_admin_params)

    respond_to do |format|
      if @relief_camp_admin.save
        format.html { redirect_to @relief_camp_admin, notice: 'Relief camp admin was successfully created.' }
        format.json { render :show, status: :created, location: @relief_camp_admin }
      else
        format.html { render :new }
        format.json { render json: @relief_camp_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relief_camp_admins/1
  # PATCH/PUT /relief_camp_admins/1.json
  def update
    respond_to do |format|
      if @relief_camp_admin.update(relief_camp_admin_params)
        format.html { redirect_to @relief_camp_admin, notice: 'Relief camp admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @relief_camp_admin }
      else
        format.html { render :edit }
        format.json { render json: @relief_camp_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relief_camp_admins/1
  # DELETE /relief_camp_admins/1.json
  def destroy
    @relief_camp_admin.destroy
    respond_to do |format|
      format.html { redirect_to relief_camp_admins_url, notice: 'Relief camp admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relief_camp_admin
      @relief_camp_admin = ReliefCampAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relief_camp_admin_params
      params.require(:relief_camp_admin).permit(:email, :phone, :password, :password_confirmation, :relief_camp_id)
    end
end
