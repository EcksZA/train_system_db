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
end
