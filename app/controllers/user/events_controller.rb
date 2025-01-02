class User::EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @events = @user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = current_user
    @event = @user.events.build
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)

    if @event.save
      flash[:success] = 'Event was successfully created.'
      redirect_to user_event_path(@user, @event)
    else
      flash.now[:danger] = 'Eventは作成出来ませんでした'
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  private

  def event_params
    params.require(:event).permit(:name, :day, :place, :min_bans, :max_bans, :comment)
  end
end
