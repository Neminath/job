class EventsUsersJoinTable < ActiveRecord::Basebelongs_to :follower, class_name: "User"
 
 belongs_to :followed, class_name: "User"
 belongs_to :followed, class_name: "Event"
 validates :user_id, presence: true
 validates :event_id, presence: true


end
