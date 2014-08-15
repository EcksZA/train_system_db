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

  it "sets the same objects, at different addresses, equal to each other" do
    line_1 = Line.new({:name => "Red"})
    line_1.save
    expect(Line.all[0]).to eq line_1
  end

  it "edits the name of the line object" do
    line_1 = Line.new({:name => "Red"})
    line_1.save
    line_1.edit("Green")
    expect(Line.all[0].name).to eq "Green"
  end

  it "removes the object from the lines list" do
    line_1 = Line.new({:name => "Red"})
    line_1.save
    line_2 = Line.new({:name => "Blue"})
    line_2.save
    line_1.remove
    expect(Line.all).to eq [line_2]
  end

  it "lists all the stations that a line passes through" do
    line_1 = Lines.new({:name => "Green"})
    line_1.save
    station_1 = Stations.new({:name => "Honeydew"})
    station_1.save
    station_2 = Stations.new({:name => "Killarney"})
    station_2.save
    station_3 = Stations.new({:name => "Kyalami"})
    station_3.save
    line_1.stations
    expect(line_1.stations).to eq [line_2, line_3]
  end
end
