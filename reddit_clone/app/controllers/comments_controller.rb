class CommentsController < ApplicationController
  before_action :validate_login

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    @comment.parent_comment_id = params[:comment][:parent_comment_id]
    @comment.post_id = params[:comment][:post_id] || @comment.parent_comment.post_id

    
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :parent_comment_id)
    end
end
