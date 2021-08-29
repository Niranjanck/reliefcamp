class ReliefcampUsersController < ApplicationController
  before_action :set_reliefcamp_user, only: [:show, :edit, :update, :destroy]

  # GET /reliefcamp_users
  # GET /reliefcamp_users.json
  def index
    if params[:camp_id].present?
      @relief_camp = ReliefCamp.find(params[:camp_id])
      @reliefcamp_users = @relief_camp.reliefcamp_users
    else
      @reliefcamp_users = ReliefcampUser.all
    end

  end

  # GET /reliefcamp_users/1
  # GET /reliefcamp_users/1.json
  def show
  end

  # GET /reliefcamp_users/new
  def new
    @reliefcamp_user = ReliefcampUser.new
  end

  # GET /reliefcamp_users/1/edit
  def edit
  end

  # POST /reliefcamp_users
  # POST /reliefcamp_users.json
  def create
    @reliefcamp_user = ReliefcampUser.new(reliefcamp_user_params)
    @reliefcamp_user.relief_camp_id = current_relief_camp_admin.relief_camp.id
    respond_to do |format|
      if @reliefcamp_user.save
        format.html { redirect_to @reliefcamp_user, notice: 'Reliefcamp user was successfully created.' }
        format.json { render :show, status: :created, location: @reliefcamp_user }
      else
        format.html { render :new }
        format.json { render json: @reliefcamp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reliefcamp_users/1
  # PATCH/PUT /reliefcamp_users/1.json
  def update
    respond_to do |format|
      if @reliefcamp_user.update(reliefcamp_user_params)
        format.html { redirect_to @reliefcamp_user, notice: 'Reliefcamp user was successfully updated.' }
        format.json { render :show, status: :ok, location: @reliefcamp_user }
      else
        format.html { render :edit }
        format.json { render json: @reliefcamp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reliefcamp_users/1
  # DELETE /reliefcamp_users/1.json
  def destroy
    @reliefcamp_user.destroy
    respond_to do |format|
      format.html { redirect_to reliefcamp_users_url, notice: 'Reliefcamp user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reliefcamp_user
      @reliefcamp_user = ReliefcampUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reliefcamp_user_params
      params.require(:reliefcamp_user).permit(:name, :age, :address, :gender, :phone)
    end
end
