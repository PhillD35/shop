class Book < Product
  attr_reader :genre

  def initialize(data)
    super

    @genre = data[:genre]
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@creator}, #{show_price_and_amount}"
  end
end
