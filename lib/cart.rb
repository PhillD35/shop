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
    @goods.uniq.sort_by(&:type).map do |product|
      "#{product} x #{amount_in_cart[product]}"
    end.join("\n")
  end

  private

  def amount_in_cart
    @goods.each_with_object({}) do |product, object|
      add_amount_for_product(product, object)
    end
  end

  def add_amount_for_product(product, object)
    if object.key?(product)
      object[product] += 1
    else
      object.merge!({product => 1})
    end
  end
end
