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
    @goods.map(&:price).sum
  end

  def to_s
    @goods
    .sort_by(&:title)
    .map(&:to_s)
    .join("\n")
  end
end
