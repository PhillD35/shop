class Book < Product
  attr_accessor :genre

  def self.from_file(path)
    lines = File.readlines(path, chomp: true, encoding: 'UTF-8')

    data = {
      title: lines[0],
      genre: lines[1],
      creator: lines[2],
      price: lines[3],
      amount: lines[4],
    }

    self.new(data)
  end

  def initialize(data)
    super

    @genre = data[:genre]
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@creator}, #{show_price_and_amount}"
  end
end
