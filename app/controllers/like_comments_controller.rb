class LikeCommentsController < ApplicationController
  before_action :set_like_comment, only: [:show, :edit, :update, :destroy]

  # GET /like_comments
  # GET /like_comments.json
  def index
    @like_comments = LikeComment.all
  end

  # GET /like_comments/1
  # GET /like_comments/1.json
  def show
  end

  # GET /like_comments/new
  def new
    @like_comment = LikeComment.new
  end

  # GET /like_comments/1/edit
  def edit
  end

  # POST /like_comments
  # POST /like_comments.json
  def create
    @like_comment = LikeComment.new(like_comment_params)
    if user_signed_in?
      @like_comment.parent_type= 'User'
      @like_comment.parent_id = current_user.id
    end
    respond_to do |format|
      if @like_comment.save
        format.html { redirect_to '/user', notice: 'Like comment was successfully created.' }
        format.json { render :show, status: :created, location: @like_comment }
      else
        format.html { render :new }
        format.json { render json: @like_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /like_comments/1
  # PATCH/PUT /like_comments/1.json
  def update
    respond_to do |format|
      if @like_comment.update(like_comment_params)
        format.html { redirect_to @like_comment, notice: 'Like comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @like_comment }
      else
        format.html { render :edit }
        format.json { render json: @like_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /like_comments/1
  # DELETE /like_comments/1.json
  def destroy
    @like_comment.destroy
    respond_to do |format|
      format.html { redirect_to like_comments_url, notice: 'Like comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_comment
      @like_comment = LikeComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_comment_params
      params.require(:like_comment).permit(:like, :comment, :parent_id, :parent_type, :notification_id)
    end
end
