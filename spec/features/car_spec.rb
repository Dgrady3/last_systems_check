require 'rails_helper'

feature "Records a newly aquired car", %{
  As a car salesperson
  it want to record a newly acquired create
  So that I can list it in my lot
  } do

  scenario "Salesperson fills out form correctly" do
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

  scenario "Salesperson forgets to specify a manufacturer" do
    visit cars_path
    car = FactoryGirl.create(:car)
    click_on "Create a record for new a car!"
    fill_in "Color", with: car.color
    fill_in "Year", with: car.year
    fill_in "Mileage", with: car.mileage
    click_on "Submit"
    expect(page).to have_content "Manufacturer can't be blank"
  end

  scenario "Salesperson fills out a blank form" do
    visit cars_path
    click_on "Create a record for new a car!"
    click_on "Submit"
    expect(page).to have_content "Manufacturer can't be blank"
    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Mileage is not a number"
    expect(page).to have_content "Year is not a number"
  end
end
