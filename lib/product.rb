class Product
  attr_accessor :amount, :price

  def initialize(data)
    @amount = data[:amount]
    @price = data[:price]
  end
end
