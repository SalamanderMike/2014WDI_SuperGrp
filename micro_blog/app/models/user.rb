class User < ActiveRecord::Base
	has_secure_password

	# validation for user for email, firstname, lastname
	validates :email, presence: true, uniqueness: {case_sensitive: false}, :format => {:with => /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "address must be valid"} 
	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :password, :format => {:with => /\A\^[([a-z]|[A-Z])0-9_-]{6,15}$\z/, message: "must be at least 6 characters and include one number and one letter."}, on: :create

	def self.authenticate email, password
		# user = User.find_by_email email
		# user if user and user.authenticate password
		User.find_by_email(email).try(:authenticate,password)
	end

	has_many :posts
	has_many :pages
end
