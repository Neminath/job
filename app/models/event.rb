class Event < ActiveRecord::Base
	
	has_many :relationships, foreign_key: "event_id", dependent: :destroy

end
