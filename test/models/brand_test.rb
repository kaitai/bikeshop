require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  test "brand requires name" do 
    brand = FactoryGirl.build(:brand, name: nil)
    assert !brand.save, "Could not save without a name"
  end

end
