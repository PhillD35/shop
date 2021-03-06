class Product
  attr_accessor :amount, :creator, :title, :type, :price

  def self.from_file
    raise NotImplementedError
  end

  def initialize(data)
    @amount = data[:amount].to_i
    @creator = data[:creator]
    @title = data[:title]
    @type = self.class.to_s.downcase
    @price = data[:price].to_i
  end

  def to_s
    raise NotImplementedError
  end

  def sold_out?
    @amount.zero?
  end

  def price_and_amount_to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  def update(data)
    keys_to_update = data.keys & allowed_keys

    keys_to_update.each { |key| instance_variable_set("@#{key}", data[key]) }
  end

  private

  def allowed_keys
    self.instance_variables.map do |var|
      var.to_s
         .gsub('@', '')
         .to_sym
    end
  end
end
