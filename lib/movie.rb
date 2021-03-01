class Movie < Product
  attr_accessor :year

  def self.from_file(path)
    lines = File.readlines(path, chomp: true, encoding: 'UTF-8')

    data = {
      title: lines[0],
      creator: lines[1],
      year: lines[2],
      price: lines[3],
      amount: lines[4]
    }

    self.new(data)
  end

  def initialize(data)
    super

    @year = data[:year]
  end

  def to_s
    "Фильм \"#{@title}\", #{@year}, реж. #{@creator}, " \
    "#{price_and_amount_to_s}"
  end
end
