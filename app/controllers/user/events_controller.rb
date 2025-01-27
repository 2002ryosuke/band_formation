class User::EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @events = Event.where(user_id: @user.id)

    Rails.logger.info "User: #{@user.inspect}"
    Rails.logger.info "Events: #{@events.inspect}"
  end

  def show
    @user = current_user
    @event = Event.find_by(id: params[:id])

  if @event.nil?
    flash[:danger] = "Event not found."
    redirect_to user_events_path # 適切なリダイレクト先に変更
  end

  @my_bands = BandRequest.where(event_id: @event.id, user_id: @user.id)
  @other_bands = BandRequest.where(event_id: @event.id).where.not(user_id: @user.id)

  @my_count=counts(@my_bands)
  @other_count=counts(@other_bands)
  end

  def new
    @event = current_user.events.build
  end

  def create
    Rails.logger.info "Current user: #{current_user.inspect}"

    @event = current_user.events.build(event_params)
    @event.user = current_user # 明示的に user を設定
    @event.random_number = SecureRandom.hex(10)
  
    Rails.logger.info "Event after user assignment: #{@event.inspect}"

    if @event.save
      flash[:success] = 'Event was successfully created.'
      redirect_to user_event_path(@event)
    else
      Rails.logger.error "Save failed: #{@event.errors.full_messages}"
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

  def join_form
    @user = current_user
  end

  def join
    @random_number = params[:random_number]
    @event = Event.find_by(random_number: @random_number)
    
    if @event.nil?
      flash.now[:alert] = "イベントが見つかりませんでした"
      render :join_form
      return
    end

    if @event.users.include?(current_user)
      flash[:alert] = "すでにイベントに参加しています"
      redirect_to user_event_path(@event)
      return
    end

    @event.users << current_user
    flash[:notice] = "イベントに参加しました"
    redirect_to user_event_path(@event)
  end
  
  def participation
    @event = current_user.events
    @my_event = Event.where(user_id: current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:name, :day, :place, :min_bans, :max_bans, :comment)
  end

  #募集人数
  def counts(counts)
    a=[]
    p counts
    return 0 if counts.empty? # countsが空の場合、空配列を返すことでnilエラーを防ぐ
    counts.each do |m|
      count = Interest.where(band_request_id: m.id).count
      p count
      a << count
    end
    p a
  return a
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
