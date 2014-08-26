class User < ActiveRecord::Base
	# validation for user for email, firstname, lastname
	validates :email, uniqueness: true, presence: true
	validates :first_name, presence: true
  	validates :last_name, presence: true

	has_many :posts
	has_many :pages
end









