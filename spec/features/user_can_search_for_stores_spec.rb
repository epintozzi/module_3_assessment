require "rails_helper"

describe "user can search for stores" do
  scenario "a user can search for stores", :vcr do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in a search box with "80202" and click "search"
    fill_in :search, with: "80202"
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq(search_path)
    # And I should see stores within 25 miles of 80202

    # And I should see a message that says "16 Total Stores"
    expect(page).to have_content("16 Total Stores")
    # And I should see exactly 15 results

    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("Denver")
    expect(page).to have_content(3.25)
    expect(page).to have_content("303-270-9189")
    expect(page).to have_content("Mobile")
  end
end
