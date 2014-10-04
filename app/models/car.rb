class Car < ActiveRecord::Base
  validates :manufacturer_id, :mileage, numericality: { only_integer: true} presence: true
  validates_numericality_of :year, :greater_than_or_equal_to 1920
  validates :color, presence: true
end
