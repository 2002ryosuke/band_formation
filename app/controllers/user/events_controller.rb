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
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    # ランダムな値を生成して保存
    # begin
    #   @event.random_number = SecureRandom.hex(10)
    #   Rails.logger.info "Generated random_number: #{@event.random_number}"
      if @event.save
        flash[:success] = 'Event was successfully created.'
        redirect_to user_event_path(current_user, @event)
      else
        flash.now[:danger] = 'Eventは作成出来ませんでした'
        render :new
      end
    # rescue ActiveRecord::RecordNotUnique
    #   retry
    # end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def join
    @user = current_user

  end
  
  private

  def event_params
    params.require(:event).permit(:name, :day, :place, :min_bans, :max_bans, :comment, :random_number)
  end

  # def generate_unique_random_number
  #   random_number = nil
  #   loop do
  #     random_number = SecureRandom.hex(10)
  #     break unless Event.exists?(random_number: random_number)
  #   end
  #   random_number
  # end
end
