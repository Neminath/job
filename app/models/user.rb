class User < ActiveRecord::Base
        #before_save { self.Email = Email.downcase }
	validates :Name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :Email, presence: true,
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }

	has_many :relationships, foreign_key: "user_id", dependent: :destroy
	
    def User.new_remember_token
	  SecureRandom.urlsafe_base64
	end

	def attend (event)
		relationships.create!(:eventi_d => event.id)
	end

	def leave (event)
		relationships.find(:event_id=> event.id).destroy
	end	

	def attended?(event)
		if relationships.find(:event_id=> event.id).nil?
			false
		else
			true
		end
	end
	def User.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end
   
       private
        def create_remember_token
         self.remember_token = User.digest(User.new_remember_token)
        end



end
