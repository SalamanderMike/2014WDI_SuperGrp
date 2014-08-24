require 'rails_helper'

RSpec.describe Page, :type => :model do

  it "has necessary attributes" do
    page = Page.new(name: "supergroup", content: "battling github!", user_id: 1)
    expect(page.name).to eq("supergroup")
    expect(page.content).to eq("battling github!")
    expect(page.user_id).to eq(1)
    expect(page.new_record?).to eq(true)
  end

end