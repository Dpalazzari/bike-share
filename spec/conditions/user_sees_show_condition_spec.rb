require './spec/spec_helper'

describe "when user visits /conditions/:id" do
  before :each do
    @condition = Condition.create(date: "Thu, 01 Jan 2015")
  end

  it "user sees condition" do

    visit("/conditions/#{@condition.id}")

save_and_open_page

    expect(page).to have_content("#{@condition.date}")
  end

  # it "user sees station attributes" do
  #   visit("/stations/#{@station.id}")
  #
  #   expect(page).to have_content("#{@station.city.name}")
  #   expect(page).to have_content("#{@station.dock_count}")
  #   expect(page).to have_content("#{@station.installation_date.inspect}")
  # end
  #
  # it "user returns to index" do
  #   visit("/stations/#{@station.id}")
  #
  #   click_on "Return"
  #
  #   expect(current_path).to eq("/stations")
  # end
  #
  # it "user edits a station" do
  #   visit("/stations/#{@station.id}")
  #
  #   click_on("Edit")
  #
  #   expect(current_path).to eq("/stations/#{@station.id}/edit")
  # end
  #
  # it "user deletes a station" do
  #   visit("/stations/#{@station.id}")
  #
  #   click_on("Delete")
  #
  #   expect(current_path).to eq('/stations')
  # end
end
