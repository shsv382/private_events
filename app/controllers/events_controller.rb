class EventsController < ApplicationController
  def index

  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	@event.creator_id = current_user.id
  	if @event.save
		flash[:success] = "Событие создано!"
		redirect_to current_user
	else
		flash.now[:error] = "Неправильные данные!"
		render :new
	end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
  	params.require(:event).permit(:name, :location, :date)
  end

end
