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
    raise NotImplementedError
  end

  def sold_out?
    @amount == 0
  end

  def show_price_and_amount
    "#{@price} руб. (осталось #{@amount})"
  end

  def update(data)
    keys_to_update = data.keys & allowed_keys

    keys_to_update.each do |key|
      instance_variable_set("@#{key}", data[key])
    end
  end

  private

  def allowed_keys
    self.instance_variables.map do |var|
      var.to_s.gsub('@', '').to_sym
    end
  end
end
