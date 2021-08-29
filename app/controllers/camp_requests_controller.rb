class CampRequestsController < ApplicationController
  before_action :set_camp_request, only: [:show, :edit, :update, :destroy, :accept]

  # GET /camp_requests
  # GET /camp_requests.json
  def index
    if current_relief_camp_admin.present?
      @camp_requests = current_relief_camp_admin.relief_camp.camp_requests
    else
      @camp_requests = CampRequest.all
    end
  end

  # GET /camp_requests/1
  # GET /camp_requests/1.json
  def show
  end

  # GET /camp_requests/new
  def new
    @camp_request = CampRequest.new
  end

  # GET /camp_requests/1/edit
  def edit
  end

  # POST /camp_requests
  # POST /camp_requests.json
  def create
    @camp_request = CampRequest.new(camp_request_params)
    @camp_request.relief_camp_id = current_relief_camp_admin.relief_camp.id

    respond_to do |format|
      if @camp_request.save
        format.html { redirect_to @camp_request, notice: 'Camp request was successfully created.' }
        format.json { render :show, status: :created, location: @camp_request }
      else
        format.html { render :new }
        format.json { render json: @camp_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_requests/1
  # PATCH/PUT /camp_requests/1.json
  def update
    respond_to do |format|
      if @camp_request.update(camp_request_params)
        format.html { redirect_to @camp_request, notice: 'Camp request was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp_request }
      else
        format.html { render :edit }
        format.json { render json: @camp_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    center_item = CenterItem.where(item_id: @camp_request.item_id,collection_center_id: current_collection_center_admin.collection_center_id).where("center_items.quantity > ?", @camp_request.quantity).first
    camp_item = CampItem.find_or_create_by(item_id: @camp_request.item_id,relief_camp_id: @camp_request.relief_camp_id)
    @camp_request.update!(status: 'closed',collection_center_id: current_collection_center_admin.collection_center_id)
    quantity = center_item.quantity - @camp_request.quantity
    camp_quantity = camp_item.quantity.to_i + @camp_request.quantity
    center_item.update!(quantity: quantity)
    camp_item.update!(quantity: camp_quantity)
    respond_to do |format|
      format.html { redirect_to camp_requests_url, notice: 'Camp request was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # DELETE /camp_requests/1
  # DELETE /camp_requests/1.json
  def destroy
    @camp_request.destroy
    respond_to do |format|
      format.html { redirect_to camp_requests_url, notice: 'Camp request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_request
      @camp_request = CampRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_request_params
      params.require(:camp_request).permit(:status, :quantity, :relief_camp_id, :item_id, :collection_center_id)
    end
end
