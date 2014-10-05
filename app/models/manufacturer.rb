class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name, presence: true, uniqueness: { message: "That Manufacturer already exists!" }
  validates :country, presence: true
end
