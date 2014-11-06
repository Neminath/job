class Event < ActiveRecord::Base
	has_many :user , dependent: :destroy
	has_many :relationships, foreign_key: "event_id", dependent: :destroy

 end

  class User < ActiveRecord::Base
  has_many : Event

   


end


