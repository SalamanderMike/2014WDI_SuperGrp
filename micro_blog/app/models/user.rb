class User < ActiveRecord::Base
	has_secure_password

	# validation for user for email, firstname, lastname
	validates :email, presence: true, uniqueness: {case_sensitive: false} 
	validates :password, length: {minimum: 3}, on: :create
	validates :first_name, presence: true
  	validates :last_name, presence: true

	def self.authenticate email, password
		# user = User.find_by_email email
		# user if user and user.authenticate password
		User.find_by_email(email).try(:authenticate,password)
	end

	has_many :posts
	has_many :pages
end
