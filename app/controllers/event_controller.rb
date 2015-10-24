class EventController < ApplicationController
  def index
  	@events = Event.all.order(:name)
  end

  def create
  	Event.create :name => params[:name]
  	redirect_to event_index_path
  end

  def destroy
  	Event.find_by_id(params[:id]).destroy
  	redirect_to event_index_path
  end
end
