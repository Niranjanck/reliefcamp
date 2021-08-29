class CollectionCentersController < ApplicationController
  before_action :set_collection_center, only: [:show, :edit, :update, :destroy]

  # GET /collection_centers
  # GET /collection_centers.json
  def index
    @collection_centers = CollectionCenter.all
  end

  # GET /collection_centers/1
  # GET /collection_centers/1.json
  def show
  end

  # GET /collection_centers/new
  def new
    @collection_center = CollectionCenter.new
  end

  # GET /collection_centers/1/edit
  def edit
  end

  # POST /collection_centers
  # POST /collection_centers.json
  def create
    @collection_center = CollectionCenter.new(collection_center_params)

    respond_to do |format|
      if @collection_center.save
        format.html { redirect_to @collection_center, notice: 'Collection center was successfully created.' }
        format.json { render :show, status: :created, location: @collection_center }
      else
        format.html { render :new }
        format.json { render json: @collection_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_centers/1
  # PATCH/PUT /collection_centers/1.json
  def update
    respond_to do |format|
      if @collection_center.update(collection_center_params)
        format.html { redirect_to @collection_center, notice: 'Collection center was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_center }
      else
        format.html { render :edit }
        format.json { render json: @collection_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_centers/1
  # DELETE /collection_centers/1.json
  def destroy
    @collection_center.destroy
    respond_to do |format|
      format.html { redirect_to collection_centers_url, notice: 'Collection center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_center
      @collection_center = CollectionCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_center_params
      params.require(:collection_center).permit(:center_name, :description, :locationId, :admin_name, :phone, :address, :latitude, :longitude)
    end
end
