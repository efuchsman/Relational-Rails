class Dealership < ApplicationRecord
  has_many :cars

  def counting_cars
    self.cars.count
  end
end
