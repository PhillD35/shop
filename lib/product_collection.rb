class ProductCollection
  attr_reader :products

  PRODUCT_TYPES = [
  {type: Book, path: 'data/books/*.txt'},
  {type: Disc, path: 'data/discs/*.txt'},
  {type: Movie, path: 'data/movies/*.txt'}
  ]

  def self.from_dir(dir_path)
    result =
      PRODUCT_TYPES.each_with_object([]) do |product_type, object|
        path = File.join(dir_path, product_type[:path])
        list_of_files = Dir[path]

        object << self.products_from_dir(product_type[:type], list_of_files)
      end

      self.new(result.flatten)
  end

  def self.products_from_dir(type, list_of_files)
    list_of_files.map { |file| type.from_file(file) }
  end

  def initialize(products)
    @products = products
  end

  def [](index)
    compact_products[index]
  end

  def compact_products
    @products.reject(&:sold_out?)
  end

  def each(&block)
    compact_products.each(&block)
  end

  def to_a
    compact_products
  end

  def to_s
    compact_products.each.with_index(1).map do |product, index|
      "#{index}. #{product}"
    end.join("\n")
  end

  def size
    compact_products.size
  end

  def sort(by: :price, reverse: false)
    sorted_list = compact_products.sort_by(&by)

    reverse ? sorted_list : sorted_list.reverse
  end

  def sort!(by: :price, reverse: false)
    compact_products.sort_by!(&by)

    reverse ? @products : @products.reverse
  end
end
