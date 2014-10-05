require 'rails_helper'

feature "Records a newly aquired car", %Q{
  As a car salesperson
  it want to record a newly acquired create
  So that I can list it in my lot
  } do

  scenario "Salesperson specifies a manufacturer, color, year, and mileage" do
    visit cars_path
    car = FactoryGirl.create(:car)
    manufacturer = FactoryGirl.build(:manufacturer)
    click_on "Create a record for new a car!"
    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: car.color
    fill_in "Year", with: car.year
    fill_in "Mileage", with: car.mileage
    click_on "Submit"

    expect(page).to have_content "Your record has been created successfully!"
  end
end
