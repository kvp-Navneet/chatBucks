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
    respond_to do |format|
     if @post.save
      format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      format.json { render :show, status: :created, location: @home }
    else
      format.html { redirect_to root_path, notice: 'content should be present.'}
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
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
 respond_to do |format|

    format.html { redirect_to :back }
    format.json { head :no_content }
    format.js { render :layout => false }
    @post.upvote_by current_user
  end
end  

def downvote
  @post = Post.find(params[:id])
  
  respond_to do |format|

    format.html { redirect_to :back }
    format.json { head :no_content }
    format.js { render :layout => false }
    @post.downvote_by current_user
  end 
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

