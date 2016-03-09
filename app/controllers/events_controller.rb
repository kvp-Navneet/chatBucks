class EventsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :destroy]
  respond_to :html, :js

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new', notice: @event.errors.full_messages.first
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def upvote 
   @event = Event.find(params[:id])
   @event.upvote_by current_user
   redirect_to :back
  end  

  def downvote
    @event = Event.find(params[:id])
    @event.downvote_by current_user
    redirect_to :back
  end
   

  private
  def event_params
    params.require(:event).permit(:name, :when)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
