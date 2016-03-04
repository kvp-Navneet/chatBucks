class FriendshipsController < ApplicationController

   def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to home_myfriend_path
   else
      flash[:alert] = "Already in your list."
      redirect_to home_find_friends_path
    end
  end
  
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to home_myfriend_path
  end
 
end