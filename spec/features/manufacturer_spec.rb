require 'rails_helper'

feature "Records a car manufacturer", %{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  } do

  scenario "Salesperson specifies a manufacturer name and country" do
    manufacturer = FactoryGirl.build(:manufacturer)
    visit manufacturers_path
    click_on "Create a record for a car manufacturer!"
    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country
    click_on "Submit"
    expect(page).to have_content "Your record has been created successfully!"
  end

  scenario "Salesperson specifies a manufacturer name that has already been made" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit manufacturers_path
    click_on "Create a record for a car manufacturer!"
    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country
    click_on "Submit"
    expect(page).to have_content "Your record could not be completed"
    expect(page).to have_content "That Manufacturer already exists!"
  end

  scenario "Salesperson can't submit an empty form" do
    visit manufacturers_path
    click_on "Create a record for a car manufacturer!"
    click_on "Submit"
    expect(page).to have_content "Your record could not be completed"
  end
end
