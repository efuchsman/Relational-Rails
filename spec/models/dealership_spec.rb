require 'rails_helper'

RSpec.describe Dealership, type: :model do
 it {should have_many :cars}
end
