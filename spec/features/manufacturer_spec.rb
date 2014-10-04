require 'rails_helper'

feature "Records a car manufacturer", %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  } do

  scenario "Salesperson specifies a manufacturer name and country" do

    visit manufacturers_path

    manufacturer = FactoryGirl.create(:manufacturer)
    click_on "Create a record for a car manufacturer!"
    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country
    click_on "Submit"
     save_and_open_page

    expect(page).to have_content "Your record has been created successfully!"
  end
end




