class Cart
  def initialize
    @products = []
  end

  def add(product)
    product.amount -= 1

    @products << product
  end

  def empty?
    @products.empty?
  end

  def total
    @products.sum(&:price)
  end

  def to_s
    @products.uniq.map do |product|
      "#{product} x #{@products.count(product)}"
    end.join("\n")
  end
end
