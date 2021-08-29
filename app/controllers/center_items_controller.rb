class CenterItemsController < ApplicationController
  before_action :set_center_item, only: [:show, :edit, :update, :destroy]

  # GET /center_items
  # GET /center_items.json
  def index
    if current_collection_center_admin.present?
      @center_items = current_collection_center_admin.collection_center.center_items
    else
      @center_items = CenterItem.all
    end
  end

  # GET /center_items/1
  # GET /center_items/1.json
  def show
  end

  # GET /center_items/new
  def new
    @center_item = CenterItem.new
  end

  # GET /center_items/1/edit
  def edit
  end

  # POST /center_items
  # POST /center_items.json
  def create
    @center_item = CenterItem.new(center_item_params)
    @center_item.collection_center_id = current_collection_center_admin.collection_center.id

    respond_to do |format|
      if @center_item.save
        format.html { redirect_to @center_item, notice: 'Center item was successfully created.' }
        format.json { render :show, status: :created, location: @center_item }
      else
        format.html { render :new }
        format.json { render json: @center_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /center_items/1
  # PATCH/PUT /center_items/1.json
  def update
    respond_to do |format|
      if @center_item.update(center_item_params)
        format.html { redirect_to @center_item, notice: 'Center item was successfully updated.' }
        format.json { render :show, status: :ok, location: @center_item }
      else
        format.html { render :edit }
        format.json { render json: @center_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /center_items/1
  # DELETE /center_items/1.json
  def destroy
    @center_item.destroy
    respond_to do |format|
      format.html { redirect_to center_items_url, notice: 'Center item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center_item
      @center_item = CenterItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_item_params
      params.require(:center_item).permit(:quantity, :collection_center_id, :item_id)
    end
end
