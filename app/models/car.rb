class Car < ApplicationRecord
  belongs_to :dealership

  def self.miles_threshold(integer)
    self.where("miles > #{integer}")
  end

end
