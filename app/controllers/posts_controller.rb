class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.where(approve: true).paginate(:page => params[:page], :per_page=>6)
  end

  # GET /posts/1 or /posts/1.json
  def show
    if user_signed_in?

    else
      redirect_to root_path
    end
  end

  # GET /posts/new
  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  # GET /posts/1/edit
  def edit
    if user_signed_in?

    else
      redirect_to root_path
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      post_record = Post.find(params[:post_status][:id])
    
      if params[:post_status][:approve] == "on"
        post_record.approve = true
      else params[:post_status][:bann] == "on"
        post_record.approve = false
      end
      post_record.save
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :cover, :content, :created_at, :images)
    end
end
