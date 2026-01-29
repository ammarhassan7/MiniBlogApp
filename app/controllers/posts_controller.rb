class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # MAGICAL LINE: This finds the @post and checks permissions automatically.
  # It replaces 'set_post' and 'authorize_user!'
  load_and_authorize_resource except: [:index, :show, :create]

  # Note: We exclude :create because 'new' builds the resource, but :create
  # needs strictly manual params handling in Mongoid sometimes.
  # We exclude :index/:show because we allow everyone to read.

  # GET /posts
  # GET /posts
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(6)
  end

  # GET /posts/1
  def show
    # @post is already loaded, but we don't strictly need auth to view
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    # @post is already built by load_and_authorize_resource if we didn't exclude it,
    # but strictly manual is often cleaner for 'new' with current_user association.
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
    # @post is already loaded and authorized by the macro
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    # Manually authorize the creation
    authorize! :create, @post

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    # @post loaded & authorized
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    # @post loaded & authorized
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
  # We removed 'set_post' because load_and_authorize_resource handles it
  # We removed 'authorize_user!' because CanCanCan handles it

  def post_params
    params.require(:post).permit(:title, :body)
  end
end