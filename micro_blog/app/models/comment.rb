class Comment < ActiveRecord::Base

#validation for comment verify content
# length min, max
# presence


validates :content, presence: true, length: {
    minimum: 1,
    maximum: 150,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} characters",
    too_long: "must have at most %{count} characters"
  }

belongs_to :post
has_many :comments, as: :commentable
belongs_to :commentable, polymorphic: true

end