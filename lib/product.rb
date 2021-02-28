class Product
  attr_accessor :amount
  attr_reader :creator, :title, :price

  def initialize(data)
    @amount = data[:amount]
    @creator = data[:creator]
    @title = data[:title]
    @price = data[:price]
  end

  def to_s
    # todo
  end

  def show_price_and_amount
    "#{@price}. (останось #{@amount})"
  end
end
