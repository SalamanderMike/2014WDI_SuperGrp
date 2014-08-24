require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it "has necessary attributes" do
    user = User.new(email: "tacos@gmail.com",first_name: "Dos", last_name: "Equis", image_url: "")
    expect(user.email).to eq("tacos@gmail.com")
    expect(user.first_name).to eq("Dos")
    expect(user.last_name).to eq("Equis")
    expect(user.image_url).to eq("")
  end

end
