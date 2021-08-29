class CollectionCenterAdminsController < ApplicationController
  before_action :set_collection_center_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_super_admin!

  # GET /collection_center_admins
  # GET /collection_center_admins.json
  def index
    @collection_center_admins = CollectionCenterAdmin.all
  end

  # GET /collection_center_admins/1
  # GET /collection_center_admins/1.json
  def show
  end

  # GET /collection_center_admins/new
  def new
    @collection_center_admin = CollectionCenterAdmin.new
  end

  # GET /collection_center_admins/1/edit
  def edit
  end

  # POST /collection_center_admins
  # POST /collection_center_admins.json
  def create
    @collection_center_admin = CollectionCenterAdmin.new(collection_center_admin_params)

    respond_to do |format|
      if @collection_center_admin.save
        format.html { redirect_to @collection_center_admin, notice: 'Collection center admin was successfully created.' }
        format.json { render :show, status: :created, location: @collection_center_admin }
      else
        format.html { render :new }
        format.json { render json: @collection_center_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_center_admins/1
  # PATCH/PUT /collection_center_admins/1.json
  def update
    respond_to do |format|
      if @collection_center_admin.update(collection_center_admin_params)
        format.html { redirect_to @collection_center_admin, notice: 'Collection center admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_center_admin }
      else
        format.html { render :edit }
        format.json { render json: @collection_center_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_center_admins/1
  # DELETE /collection_center_admins/1.json
  def destroy
    @collection_center_admin.destroy
    respond_to do |format|
      format.html { redirect_to collection_center_admins_url, notice: 'Collection center admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_center_admin
      @collection_center_admin = CollectionCenterAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_center_admin_params
      params.require(:collection_center_admin).permit(:email, :phone, :password, :password_confirmation, :collection_center_id)
    end
end
