class Product
  attr_accessor :amount, :creator, :title, :price

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

  def allowed_keys
    self.instance_variables.map do |var|
      var.to_s.gsub('@', '').to_sym
    end
  end

  def update(data)
    keys_to_update = data.keys & allowed_keys

    keys_to_update.each do |key|
      instance_variable_set("@#{key}", data[key])
    end
  end
end
