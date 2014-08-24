class Page < ActiveRecord::Base
	# validation to verify name, content
 	validates :name, presence: true
 	validates :content, presence: true, length: {
    minimum: 300,
    maximum: 400,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
	belongs_to :user
end
