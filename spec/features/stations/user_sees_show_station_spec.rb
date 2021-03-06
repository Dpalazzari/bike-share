require './spec/spec_helper'

describe "when user visits /stations/:id" do
  before :each do
    @city = City.create(name: "Denver")
    @station = @city.stations.create(name: "Dock", dock_count: 20, installation_date: "01/01/2009")
  end

  it "user sees station name" do
    visit("/stations/#{@station.id}")

    expect(page).to have_content("#{@station.name}")
  end

  it "user sees station attributes" do
    visit("/stations/#{@station.id}")

    expect(page).to have_content("#{@station.city.name}")
    expect(page).to have_content("#{@station.dock_count}")
    expect(page).to have_content("#{@station.installation_date.inspect}")
  end

  it "user edits a station" do
    visit("/stations/#{@station.id}")

    click_on("Edit")

    expect(current_path).to eq("/stations/#{@station.id}/edit")
  end

  it "user deletes a station" do
    visit("/stations/#{@station.id}")

    click_on("Delete")

    expect(current_path).to eq('/stations')
  end

  it "user sees station analytics" do
    visit("/stations/#{@station.id}")

    expect(page).to have_content("Rides Started at Station:")
    expect(page).to have_content("Rides Ended at Station:")
    expect(page).to have_content("Most Frequent Destination Station:")
    expect(page).to have_content("Most Frequent Origin Station:")
    expect(page).to have_content("Date With Most Rides:")
    expect(page).to have_content("Most Frequent Zip Code of Riders:")
    expect(page).to have_content("Most Frequently Used Bike (id):")
  end
end
