class Cart
  def initialize
    @goods = []
  end

  def add(product)
    product.amount -= 1

    @goods << product
  end

  def empty?
    @goods.empty?
  end

  def price_total
    @goods.sum(&:price)
  end

  def to_s
    @goods
      .sort_by(&:title)
      .join("\n")
  end
end
