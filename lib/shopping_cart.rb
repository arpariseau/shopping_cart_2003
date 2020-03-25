require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    total_prod = 0
    @products.map do |product| total_prod += product.quantity end
    total_prod
  end

  def is_full?
    total_number_of_products >= @capacity
  end

  def products_by_category(category)
    @products.find_all do |product| product.category == category end
  end

  def details
    details = {name: @name, capacity: @capacity}
  end

  def percentage_occupied
    pct = total_number_of_products.to_f / @capacity.to_f
    (pct * 100).truncate(2)
  end

  def sorted_products_by_quantity
    @products.sort_by {|product| product.quantity}.reverse
  end

  def product_breakdown
    categories = @products.map do |product| product.category end
    breakdown = {}
    categories.uniq.map do |category| breakdown[category] = products_by_category(category) end
    breakdown
  end

end
