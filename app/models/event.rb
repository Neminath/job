class Event < ActiveRecord::Base
	#has_many :user , dependent: :destroy
	#has_many :relationships, foreign_key: "event_id", dependent: :destroy
     has_and_belongs_to_many :users


     before_create :create_remember_token

   
    def User.new_remember_token
	  SecureRandom.urlsafe_base64
    end


	def User.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end





	private
        def create_remember_token
         self.remember_token = User.digest(User.new_remember_token)
        end
end

  #class User < ActiveRecord::Base
    # has_many : Event
   #end


