class InformationAdminsController < ApplicationController
  before_action :set_information_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_super_admin!

  # GET /information_admins
  # GET /information_admins.json
  def index
    @information_admins = InformationAdmin.all
  end

  # GET /information_admins/1
  # GET /information_admins/1.json
  def show
  end

  # GET /information_admins/new
  def new
    @information_admin = InformationAdmin.new
  end

  # GET /information_admins/1/edit
  def edit
  end

  # POST /information_admins
  # POST /information_admins.json
  def create
    @information_admin = InformationAdmin.new(information_admin_params)

    respond_to do |format|
      if @information_admin.save
        format.html { redirect_to @information_admin, notice: 'Information admin was successfully created.' }
        format.json { render :show, status: :created, location: @information_admin }
      else
        format.html { render :new }
        format.json { render json: @information_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information_admins/1
  # PATCH/PUT /information_admins/1.json
  def update
    respond_to do |format|
      if @information_admin.update(information_admin_params)
        format.html { redirect_to @information_admin, notice: 'Information admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @information_admin }
      else
        format.html { render :edit }
        format.json { render json: @information_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information_admins/1
  # DELETE /information_admins/1.json
  def destroy
    @information_admin.destroy
    respond_to do |format|
      format.html { redirect_to information_admins_url, notice: 'Information admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_admin
      @information_admin = InformationAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_admin_params
      params.require(:information_admin).permit(:email, :phone, :password, :password_confirmation)
    end
end
