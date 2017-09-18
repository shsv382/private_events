class EventsController < ApplicationController
  before_action :signed_in?, only: [:invite]
  
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
      @event.attendees << current_user
  		redirect_to current_user
  	else
  		flash.now[:error] = "Неправильные данные!"
  		render :new
  	end
  end

  def show
    @event = Event.find(params[:id])
    @users = []
    User.all.each do |user| 
      unless user.attended_events.include?(@event) && @event.creator == user
        @users << [user.name, user.name]
      else
        next
      end
    end
  end

  def invite
    invited_user = User.find_by_name(params[:name])
    @event = Event.find(params[:id])
    if invited_user && current_user == @event.creator && !(@event.attendees.include?(invited_user))
      @event.attendees << invited_user
      flash[:success] = "Пользователь #{invited_user.name} приглашен!"
      redirect_to @event
    else
      flash.now[:error] = "Нет такого пользователя"
      render :show
    end
  end

  private
  def event_params
  	params.require(:event).permit(:name, :location, :date)
  end

  def is_creator? event
    current_user == event.creator
  end

end
