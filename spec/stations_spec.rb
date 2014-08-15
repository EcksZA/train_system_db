require 'spec_helper'
require 'stations'

describe Station do
  it "initializes the stations object" do
    station_1 = Station.new({:name => "Rosebank"})
    expect(station_1).to be_an_instance_of Station
  end

  it "outputs the name of the station of the station" do
    station_1 = Station.new({:name => "Rosebank"})
    expect(station_1.name).to eq "Rosebank"
  end

  it "creates an empty array to store the stations" do
    expect(Station.all).to eq []
  end

  it "saves a new station into the stations array" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    expect(Station.all).to eq [station_1]
  end

  it "makes two objects that are the same equal to each other" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    expect(Station.all[0]).to eq station_1
  end

  it "edits the name of the station" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    station_1.edit("Killarney")
    expect(Station.all[0].name).to eq "Killarney"
  end

  it "removes an station from the station list" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    station_2 = Station.new({:name => "Craighall"})
    station_2.save
    station_1.remove
    expect(Station.all).to eq [station_2]
  end

  it "lists all the lines that stop at a station" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    line_1 = Lines.new({:name => "Green"})
    line_1.save
    line_2 = Lines.new({:name => "Yellow"})
    line_2.save
    line_3 = Lines.new({:name => "Blue"})
    line_3.save
    expect(station_1.lines).to eq [line_1, line_3]
  end
end
