require 'rails_helper'

RSpec.describe Post, :type => :model do
  
  it "has necessary attributes" do
    post = Post.new(body: "meow meow", user_id: 1)
    expect(post.body).to eq("meow meow")
    expect(post.user_id).to eq(1)
  end

end
