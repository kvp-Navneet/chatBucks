class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about]
  before_action :set_user, except: :front

  respond_to :html, :js
  def index
    @post = Post.new
    @activity = Post.where(:user_id => current_user.id)
    @event = Event.where(:user_id => current_user.id)
  end
  def find_friends
   @users= User.where.not(:id=>current_user.id)
  end
  def about 
  end 

  def front
    
  end
  
  def view_profile
   viewprofile=current_user.id
   @users = User.where.not(id:viewprofile)
  end 
  def myprofile
   @user = current_user
  end
  private
  def set_user
    @user = current_user
  end
end
