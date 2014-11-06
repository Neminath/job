class User < ActiveRecord::Base
        #before_save { self.Email = Email.downcase }
	validates :Name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :Email, presence: true,
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	before_create :create_remember_token
	validates :password, length: { minimum: 6 }
    has_and_belongs_to_many :events
    #has_many :event , dependent: :destroy
    #has_many :EventsUsersJoinTables , foreign_key: "user_id", dependent: :destroy
	#has_many :relationships, foreign_key: "user_id", dependent: :destroy
	
    def User.new_remember_token
	  SecureRandom.urlsafe_base64
	end

	def User.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end

	def attend (event)
		 
		#@user = User.first
		#@user.events << event
		current_user.events << event 
		event.users<<current_user
	end

	def leave (event)
		#@user = User.first
		#event.users.destroy_all
         event.current_user.destroy
	end	

	def attended?(event)
		#@user = User.first
		if current_user.events.first.nil?
			false
		else
			true
		end
	end
	
  
  	private
        def create_remember_token
         self.remember_token = User.digest(User.new_remember_token)
        end



end


 #class Event < ActiveRecord::Base
  #has_many : User
#end