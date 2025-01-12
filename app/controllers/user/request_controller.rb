class User::RequestController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:new, :create]
  before_action :set_band_request, only: [:new, :create]

  def new
    @request = @band.participation_requsests.new
    @user = current_user
    @categories = Category.all
  end

  def create
    @request = @band.participation_requsests.new(request_params)
    @request.user = current_user

    if @request.save
      flash[:success] = 'The request for band applications was successful!'
      Interest.create!(band_request_id: @band.id, participation_requsest_id: ParticipationRequsest.last.id)
      redirect_to  user_event_path(@event) # create後に遷移させる
    else
      flash.now[:danger] = 'Requestは作成出来ませんでした'
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private

  def request_params
    params.require(:participation_requsest).permit(:category_id, :comment)
  end  

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_band_request
    @band = BandRequest.find(params[:band_id])
  end

end
