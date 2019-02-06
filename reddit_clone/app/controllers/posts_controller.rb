class PostsController < ApplicationController

  before_action :validate_login

  def show
    @post = Post.includes(comments: [:user]).find_by(id: params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post)      
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end