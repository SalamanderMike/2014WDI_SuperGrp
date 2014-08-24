require 'rails_helper'

RSpec.describe Tag, :type => :model do
  
  it "has necessary attributes" do
    tag = Tag.new(name: "hungry")
    expect(tag.name).to eq("hungry")
  end

end
