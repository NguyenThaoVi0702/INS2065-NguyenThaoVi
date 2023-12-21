class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments or /comments.json
  def index
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end

  # POST /comments or /comments.json
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
  
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.product = @product
  
    respond_to do |format|
      if @comment.save && @rating.save
        format.html { redirect_to @product, notice: "Comment and rating were successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors.merge(@rating.errors), status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end

  def rating_params
    params.require(:comment).permit(:stars_rated)
  end
end
