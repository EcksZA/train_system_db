require 'spec_helper'

describe Train do
  it "initializes the object" do
    train_1 = Train.new({:name => "10A"})
    expect(train_1).to be_an_instance_of Train
  end

  it "creates an empty array to store all the train objects" do
    expect(Train.all).to eq []
  end
end
