class ProductCollection
  PRODUCT_TYPES = [
    {type: Book, path: 'data/books/*.txt'},
    {type: Disc, path: 'data/discs/*.txt'},
    {type: Movie, path: 'data/movies/*.txt'}
  ]

  def self.from_dir(dir_path)
    result =
      PRODUCT_TYPES.each_with_object([]) do |product_type, object|
        path = File.join(dir_path, product_type[:path])

        list_of_files =
          Dir[path]
          .map { |file| product_type[:type].from_file(file) }

        object << list_of_files
      end

    self.new(result.flatten)
  end

  def initialize(products)
    @products = products
  end

  def [](index)
    compact_products[index - 1]
  end

  def compact_products
    @products.reject(&:sold_out?)
  end

  def to_a
    compact_products
  end

  def to_s
    compact_products.map.with_index(1) do |product, index|
      "#{index}. #{product}"
    end.join("\n")
  end

  def size
    compact_products.size
  end

  def sort!(by: :price, reverse: false)
    @products.sort_by!(&by)

    reverse ? array : array.reverse!
  end
end
