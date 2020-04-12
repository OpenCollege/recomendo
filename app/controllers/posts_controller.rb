class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if current_user.followings.empty?
      render "shared/welcome"
    else
      @posts = Post.filter(params)
      @posts = @posts.posted_by(current_user.followings)
      @filtered_category = Category.find(params[:category_id]) if params[:category_id]
      @filtered_tags = params[:tags]
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if false # TODO -> Hack way to reload when coming from JS
      flash[:alert] = "Something went wrong ..."
      render "reload"
    end
  end

  # GET /posts/new
  def new
    @post = Post.new(user: current_user)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if !@post.category
      @post.category = Category.last
    end
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Recomendação criada' }
        format.json { render :show, status: :created, location: @post }
      else
        byebug
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_params
    params.permit(:category_id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :url, :tag_list)
  end


end
