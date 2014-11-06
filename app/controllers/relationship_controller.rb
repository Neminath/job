class RelationshipController < ApplicationController
	before_action :find_event, only: [:create, :destroy]  

  
end
