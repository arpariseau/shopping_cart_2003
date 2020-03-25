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

  def test_add_products
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    @cart.add_product(product1)
    assert_equal [product1], @cart.products

    @cart.add_product(product2)
    assert_equal [product1, product2], @cart.products
  end
    

end
