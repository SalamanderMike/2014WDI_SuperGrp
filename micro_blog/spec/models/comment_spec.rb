require 'rails_helper'

RSpec.describe Comment, :type => :model do
  
  it "has necessary attributes" do
    comment = Comment.new(content: "I love bananas...alot!", post_id: 1)
    expect(comment.content).to eq("I love bananas...alot!")
    expect(comment.post_id).to eq(1)
  end

end
