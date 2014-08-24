require 'rails_helper'

RSpec.describe PostTag, :type => :model do

  it "has necessary attributes" do
    pt = PostTag.new(post_id: 1, tag_id: 1)
    expect(pt.post_id).to eq(1)
    expect(pt.tag_id).to eq(1)
  end
  
end
