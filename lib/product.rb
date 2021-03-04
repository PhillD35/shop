class Product
  attr_accessor :amount, :creator, :title, :price

  def self.from_file
    raise NotImplementedError
  end

  def initialize(data)
    @amount = data[:amount].to_i
    @creator = data[:creator]
    @title = data[:title]
    @price = data[:price].to_i
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  def sold_out?
    @amount.zero?
  end

  def update(data)
    @amount = data[:amount] if data.key?(:amount)
    @creator = data[:creator] if data.key?(:creator)
    @title = data[:title] if data.key?(:title)
    @price = data[:price] if data.key?(:price)
  end
end
