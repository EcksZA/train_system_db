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
end
