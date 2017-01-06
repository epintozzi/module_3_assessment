require "rails_helper"

describe "user can search for stores" do
  scenario "a user can search for stores" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in a search box with "80202" and click "search"
    fill_in :search, with: "80202"
    click_on "search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq(search_path)
    # And I should see stores within 25 miles of 80202

    # And I should see a message that says "16 Total Stores"
    expect(page).to have_content("16 Total Stores")
    # And I should see exactly 15 results

    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    expect(page).to have_content("name")
    expect(page).to have_content("city")
    expect(page).to have_content("distance")
    expect(page).to have_content("phone")
    expect(page).to have_content("store type")
  end
end
