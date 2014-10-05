class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id, presence: true
  validates :color,presence: true
  validates :mileage, numericality: { only_integer: true}
  validates :year, numericality:  {greater_than_or_equal_to: 1920 }
end
