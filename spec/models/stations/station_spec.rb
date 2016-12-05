require './spec/spec_helper'

describe "Station" do
  describe "attributes" do

    before :each do
      @station = Station.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015", city_id: 2)
    end

    it "has an id" do
      expect(@station.id).to eq(1)
    end

    it "has name" do
      expect(@station.name).to eq("Dock")
    end

    it "has dock count" do
      expect(@station.dock_count).to eq(20)
    end

    it "has an installation date" do
      expect(@station.installation_date.inspect).to eq("Thu, 01 Jan 2015")
    end

    it "has a city id" do
      expect(@station.city_id).to eq(2)
    end
  end

  describe "validates" do
    it "presence of name" do
      invalid_station = Station.create(dock_count: 20, installation_date: "01/01/2015", city_id: 2)

      expect(invalid_station).to be_invalid
    end

    it "presence of dock count" do
      invalid_station = Station.create(name: "Dock", installation_date: "01/01/2015", city_id: 2)

      expect(invalid_station).to be_invalid
    end

    it "presence of installation date" do
      invalid_station = Station.create(name: "Dock", dock_count: 20, city_id: 2)

      expect(invalid_station).to be_invalid
    end

    it "presence of city id" do
      invalid_station = Station.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015")

      expect(invalid_station).to be_invalid
    end

    it "uniqueness of name" do
      valid_station   = Station.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015", city_id: 2)
      invalid_station = Station.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015", city_id: 2)

      expect(valid_station).to be_valid
      expect(invalid_station).to be_invalid
    end
  end

  describe "associates" do
    it "with city" do
      city = City.create(name: "denver")
      station = city.stations.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015")

      expect(station.city_id).to eq(city.id)
    end

     it "with trips" do
      station = Station.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015", city_id: 2)
      trip = station.trips.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, condition_id: 2, subscription_type_id: 1)

      expect(trip.station_id).to eq(station.id)
    end

    it "with conditions through trips" do
      station = Station.create(name: "Dock", dock_count: 20, installation_date: "01/01/2015", city_id: 2)
      condition = Condition.create(date:                 "01/01/2016",
                                   max_temperature:      80,
                                   mean_temperature:     75,
                                   min_temperature:      70,
                                   mean_humidity:        93,
                                   mean_visibility:      10,
                                   mean_wind_speed:      5,
                                   precipitation:        0,
                                   )
      trip = station.trips.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, condition_id: condition.id, subscription_type_id: 1)

      expect(station.conditions.first).to eq(condition)
    end
  end
end