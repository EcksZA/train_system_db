require 'spec_helper'

describe Line do
  it "initializes the lines object" do
    line_1 = Line.new({:name => "Red"})
    expect(line_1).to be_an_instance_of Line
  end

  it "names the object" do
    line_1 = Line.new({:name => "Red"})
    expect(line_1.name).to eq "Red"
  end

  it "creates an empty array to list all the lines" do
    expect(Line.all). to eq []
  end

  it "saves the lines into the lines list" do
    line_1 = Line.new({:name => "Red"})
    line_1.save
    expect(Line.all).to eq [line_1]
  end
end
