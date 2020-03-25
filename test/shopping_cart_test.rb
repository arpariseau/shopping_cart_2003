require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test

  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
  end

  def test_existence
    assert_instance_of ShoppingCart, @cart
  end

  def test_name_access
    assert_equal "King Soopers", @cart.name
  end

  def test_capacity_access
    assert_equal 30, @cart.capacity
  end

  def test_product_access
    assert_equal [], @cart.products
  end

end
