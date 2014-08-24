class Comment < ActiveRecord::Base

	#validation for comment verify content
	# length min, max
	# presence


	 	validates :content, presence: true, length: {
    minimum: 15,
    maximum: 40,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }

	belongs_to :post
	has_many :comments, as: :commentable
	belongs_to :commentable, polymorphic: true
end