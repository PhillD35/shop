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
    @products[index]
  end

  def each(&block)
    @products.each(&block)
  end

  def to_a
    @products
  end

  def sort(by: :price, reverse: false)
    sorted_list = @products.sort_by(&by)

    reverse ? sorted_list : sorted_list.reverse
  end

  def sort!(by: :price, reverse: false)
    @products.sort_by!(&by)

    reverse ? @products : @products.reverse
  end
end
