require 'spec_helper'

RSpec.describe Ship do 
  it '#Exists' do 
  cruiser = Ship.new("Cruiser", 3)

  expect(cruiser).to be_a(Ship)
  end
end