class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
 
  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.build_from(@post, current_user.id, "")
  end
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
  else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit

  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
  def upvote 
   @post = Post.find(params[:id])
   @post.upvote_by current_user
   redirect_to :back
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end
 
  private
  def set_post
    @post = Post.find(params[:id])
    # raise @post.inspect
  end

  def post_params
    params.require(:post).permit(:content, :attachment)
  end
end

