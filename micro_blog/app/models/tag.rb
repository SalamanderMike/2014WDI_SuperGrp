class Tag < ActiveRecord::Base
	# validation for verify name
		# uniqueness
		# presence
		# max and min length
		# format
		# no spaces or special characters


	validates :name, uniqueness: true, presence: true
 	validates :length {
    minimum: 1,
    maximum: 4,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  validates format: { with: /^\s*[a-zA-Z0-9]+\s*$/,
    message: "The tag cannot have any spaces or special characters"
  }



	has_many :post_tags
	has_many :posts, :through => :post_tags
end
