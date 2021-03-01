class Disc < Product
  attr_accessor :year, :genre

  def self.from_file(path)
    lines = File.readlines(path, chomp: true, encoding: 'UTF-8')

    data = {
      title: lines[0],
      creator: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    }

    self.new(data)
  end

  def initialize(data)
    super

    @genre = data[:genre]
    @year = data[:year]
  end

  def to_s
    "Альбом #{@creator} - \"#{@title}\", #{@genre}, #{@year}, " \
    "#{price_and_amount_to_s}"
  end
end
