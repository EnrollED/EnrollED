class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /posts
  # GET /posts.json
  def index
    authorize Post
    @posts = Post.order(:code).search(params[:search]).page(params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    authorize Post
  end

  # GET /posts/new
  def new
    authorize Post
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize Post
  end

  # POST /posts
  # POST /posts.json
  def create
    authorize Post
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Pošta je bila uspešno dodana.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize Post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Pošta je bila uspešno posodobljena.' }
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
    authorize Post
    @post.is_valid = false;                            #we set the post as inactive
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Pošta je bila označena kot neveljavna.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:code, :name, :is_valid)
    end
end
