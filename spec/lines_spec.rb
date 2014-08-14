require 'spec_helper'

describe Lines do
  it "initializes the lines object" do
    lines_1 = Lines.new({:name => "Red"})
    expect(lines_1).to be_an_instance_of Lines
  end
end
