require './spec/spec_helper'


describe "Trip" do
  describe "attributes" do
    before :each do
      @trip = Trip.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, condition_id: 2, subscription_type_id: 1)
    end

    it "has a duraiton" do
      expect(@trip.duration).to eq(300)
    end

    it "has a start date" do
      expect(@trip.start_date).to eq("01/01/2016")
    end

    it "has an end date" do
      expect(@trip.end_date).to eq("02/01/2016")
    end

    it "has an end station id and bike id" do
      expect(@trip.end_station_id).to eq(5)
      expect(@trip.bike_id).to eq(14)
    end

    it "has a zip code" do
      expect(@trip.zip_code).to eq(80918)
    end

    it "has a station id" do
      expect(@trip.station_id).to eq(3)
    end

    it "has a condition" do
      expect(@trip.condition_id).to eq(2)
    end

    it "has a subscription type" do
      expect(@trip.subscription_type_id).to eq(1)
    end

  end

  describe "validates" do

    it "presence of duration" do
      invalid_trip = Trip.create(start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, condition_id: 2, subscription_type_id: 1)

      expect(invalid_trip).to be_invalid
    end

    it "presence of start date" do
      invalid_trip = Trip.create(duration: 300, end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, condition_id: 2, subscription_type_id: 1)

      expect(invalid_trip).to be_invalid
    end

    it "presence of bike id" do
      invalid_trip = Trip.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, zip_code: 80918, station_id: 3, condition_id: 2, subscription_type_id: 1)

      expect(invalid_trip).to be_invalid
    end

    it "presence of zip code" do
      invalid_trip = Trip.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, station_id: 3, condition_id: 2, subscription_type_id: 1)

      expect(invalid_trip).to be_invalid
    end

    it "presence of station id" do
      invalid_trip = Trip.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, condition_id: 2, subscription_type_id: 1)

      expect(invalid_trip).to be_invalid
    end

    it "presence of condition" do
      invalid_trip = Trip.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, subscription_type_id: 1)

      expect(invalid_trip).to be_invalid
    end

    it "presence of subscription type id" do
      invalid_trip = Trip.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, condition_id: 2)

      expect(invalid_trip).to be_invalid
    end
  end

  describe "associates" do
    it "with conditions" do
      condition = Condition.create(date: "02/01/1990", max_temperature: 56, mean_temperature: 45, min_temperature: 31, mean_humidity: 45, mean_visibility: 10, mean_wind_speed: 45, precipitation: 10)
      trip      = condition.trips.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, subscription_type_id: 1)

      expect(trip.condition_id).to eq(condition.id)
    end

    it "with stations" do
      condition = Condition.create(date: "02/01/1990", max_temperature: 56, mean_temperature: 45, min_temperature: 31, mean_humidity: 45, mean_visibility: 10, mean_wind_speed: 45, precipitation: 10)
      trip      = condition.trips.create(duration: 300, start_date: "01/01/2016", end_date: "02/01/2016", end_station_id: 5, bike_id: 14, zip_code: 80918, station_id: 3, subscription_type_id: 1)
    end
  end
end
