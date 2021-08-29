class CenterRequestsController < ApplicationController
  before_action :set_center_request, only: [:show, :edit, :update, :destroy]

  # GET /center_requests
  # GET /center_requests.json
  def index
    if current_collection_center_admin.present?
      @center_requests = current_collection_center_admin.collection_center.center_requests
    else
      @center_requests = CenterRequest.all
    end
  end

  # GET /center_requests/1
  # GET /center_requests/1.json
  def show
  end

  # GET /center_requests/new
  def new
    @center_request = CenterRequest.new
  end

  # GET /center_requests/1/edit
  def edit
  end

  # POST /center_requests
  # POST /center_requests.json
  def create
    @center_request = CenterRequest.new(center_request_params)
    @center_request.collection_center_id = current_collection_center_admin.collection_center_id
    respond_to do |format|
      if @center_request.save
        format.html { redirect_to @center_request, notice: 'Center request was successfully created.' }
        format.json { render :show, status: :created, location: @center_request }
      else
        format.html { render :new }
        format.json { render json: @center_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /center_requests/1
  # PATCH/PUT /center_requests/1.json

  def update
    respond_to do |format|
      if @center_request.update(center_request_params)
        format.html { redirect_to @center_request, notice: 'Center request was successfully updated.' }
        format.json { render :show, status: :ok, location: @center_request }
      else
        format.html { render :edit }
        format.json { render json: @center_request.errors, status: :unprocessable_entity }
      end
    end
  end
  def accept
    @center_request = CenterRequest.find(params[:id])
    center_item = CenterItem.find_or_create_by(item_id: @center_request.item_id,collection_center_id: @center_request.collection_center_id)
    @center_request.update!(status: 'closed')
    quantity = center_item.quantity.to_i + @center_request.quantity
    center_item.update!(quantity: quantity)
    respond_to do |format|
      format.html { redirect_to center_requests_url, notice: 'Center request was successfully updated.' }
      format.json { head :no_content }
    end
  end
  # DELETE /center_requests/1
  # DELETE /center_requests/1.json
  def destroy
    @center_request.destroy
    respond_to do |format|
      format.html { redirect_to center_requests_url, notice: 'Center request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center_request
      @center_request = CenterRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_request_params
      params.require(:center_request).permit(:status, :quantity, :item_id, :collection_center_id)
    end
end
