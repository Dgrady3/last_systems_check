require 'rails_helper'

feature "Records a newly aquired car", %{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do

  before :each do
    @car = FactoryGirl.build(:car)
    visit cars_path
    click_on "Create a record for new a car!"
  end

  scenario "Salesperson fills out form correctly" do
    select @car.manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: @car.color
    fill_in "Year", with: @car.year
    fill_in "Mileage", with: @car.mileage
    click_on "Submit"

    expect(page).to have_content "Your record has been created successfully!"
  end

# This situation is covered by your last spec
  # scenario "Salesperson forgets to specify a manufacturer" do
  #   fill_in "Color", with: @car.color
  #   fill_in "Year", with: @car.year
  #   fill_in "Mileage", with: @car.mileage
  #   click_on "Submit"
  #   expect(page).to have_content "Manufacturer can't be blank"
  # end

  scenario "Salesperson fills out a blank form" do
    click_on "Submit"

    expect(page).to have_content "Manufacturer can't be blank"
    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Mileage is not a number"
    expect(page).to have_content "Year is not a number"
  end
end
