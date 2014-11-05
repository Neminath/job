class Event < ActiveRecord::Base


class User < ActiveRecord::Base
has_many :events
end
end
