class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about]
  before_action :set_user, except: :front

  respond_to :html, :js
  def index
    @post = Post.new
    @activity = Post.where(:user_id => current_user.id).order(created_at: :desc)
    @event = Event.where(:user_id => current_user.id)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc)
  end
  def find_friends
   @users= User.where.not(:id=>current_user.id)
  end
  def about 
  end 

  def front
    
  def all_activites
   @activities = PublicActivity::Activity.order(created_at: :desc)
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
