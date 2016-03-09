class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about,:front]
  before_action :set_user, except: :front
  respond_to :html, :js
  def index
    @post = Post.new
    @activities = Post.where(:user_id => current_user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @event = Event.where(:user_id => current_user.id).paginate(page: params[:page], per_page: 5)
    #@friends = @user.all_following.unshift(@user)
    #@activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
  def find_friends
   @users= User.where.not(:id=>current_user.id)
  end
  def about 
  end 

  def front
  end

  def all_activites
   @friendships = Friendship.where("user_id = ?",current_user.id).select("friend_id")
   @activities = Post.where("user_id in (?)",@friendships).paginate(page: params[:page], per_page: 5)
   @activities.each do|a|
   @new_comment = Comment.build_from(a, current_user.id, "")
    #@activities = PublicActivity::Activity.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
   end
  end
  def myfriend
   @user = current_user
  end
  private
  def set_user
    @user = current_user
  end
end
