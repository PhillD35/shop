class Movie < Product
  attr_accessor :year

  def initialize(data)
    super

    @year = data[:year]
  end

  def to_s
    "Фильм \"#{@title}\", #{@year}, реж. #{@creator}, #{show_price_and_amount}"
  end
end
