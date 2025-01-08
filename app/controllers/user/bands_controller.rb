class User::BandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:new, :create]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @band_request = @event.band_requests.new
    @categories = Category.all
    session[:previous_url] = request.referer  # ここで前ページセッションを保存
  end

  def create
    @band_request = @event.band_requests.new(band_request_params)
    @band_request.user = current_user

    if @band_request.save
      flash[:success] = 'The request for band applications was successful!'
      redirect_to session[:previous_url]  # create後に遷移させる
    else
      flash.now[:danger] = 'BandRequestは作成出来ませんでした'
      render :new
    end
  end

  private

  def band_request_params
    params.require(:band_request).permit(:name, :music_name, :playing_time, :my_category_id, :recruting_category_id, :count, :comment)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
