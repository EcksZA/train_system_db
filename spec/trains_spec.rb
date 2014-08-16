require 'spec_helper'

describe Train do
  it "initializes the object" do
    train_1 = Train.new({:name => "10A"})
    expect(train_1).to be_an_instance_of Train
  end

  it "creates an empty array to store all the train objects" do
    expect(Train.all).to eq []
  end

  it "saves the object" do
    train_1 = Train.new({:name => "10A"})
    train_1.save
    expect(Train.all).to eq [train_1]
  end

  it "sets two equal objects, with different addresses, to be equal" do
    train_1 = Train.new({:name => "10A"})
    train_1.save
    expect(Train.all[0]).to eq train_1
  end

  it "it allows for the trains name to be updated" do
    train_1 = Train.new({:name => "10A"})
    train_1.save
    train_1.edit("15B")
    expect(Train.all[0].name).to eq "15B"
  end
end
