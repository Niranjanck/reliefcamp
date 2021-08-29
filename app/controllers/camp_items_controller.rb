class CampItemsController < ApplicationController
  before_action :set_camp_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_relief_camp_admin!

  # GET /camp_items
  # GET /camp_items.json
  def index
    if current_relief_camp_admin.present?
      @camp_items = current_relief_camp_admin.relief_camp.camp_items
    else
      @camp_items = CampItem.all
    end
  end

  # GET /camp_items/1
  # GET /camp_items/1.json
  def show
  end

  # GET /camp_items/new
  def new
    @camp_item = CampItem.new
  end

  # GET /camp_items/1/edit
  def edit
  end

  # POST /camp_items
  # POST /camp_items.json
  def create
    @camp_item = CampItem.new(camp_item_params)
    @camp_item.relief_camp_id = current_relief_camp_admin.relief_camp.id

    respond_to do |format|
      if @camp_item.save
        format.html { redirect_to @camp_item, notice: 'Camp item was successfully created.' }
        format.json { render :show, status: :created, location: @camp_item }
      else
        format.html { render :new }
        format.json { render json: @camp_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_items/1
  # PATCH/PUT /camp_items/1.json
  def update
    respond_to do |format|
      if @camp_item.update(camp_item_params)
        format.html { redirect_to @camp_item, notice: 'Camp item was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp_item }
      else
        format.html { render :edit }
        format.json { render json: @camp_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_items/1
  # DELETE /camp_items/1.json
  def destroy
    @camp_item.destroy
    respond_to do |format|
      format.html { redirect_to camp_items_url, notice: 'Camp item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_item
      @camp_item = CampItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_item_params
      params.require(:camp_item).permit(:quantity, :relief_camp_id, :item_id)
    end
end
