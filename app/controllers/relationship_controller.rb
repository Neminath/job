class RelationshipController < ApplicationController
	before_action :find_event, only: [:create, :destroy]  

  def create
  	current_user.attend @event
  end

  def destroy
  	current_user.leave @event
  end

  private
  	def find_event
  		@event = Event.find(params[:id])
  	end
end
