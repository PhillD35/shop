require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/product_collection'

PRODUCT_TYPES = [
  {type: Book, path: 'data/books/*.txt'},
  {type: Disc, path: 'data/discs/*.txt'},
  {type: Movie, path: 'data/movies/*.txt'}
]

product_collection = ProductCollection.from_dir(__dir__, PRODUCT_TYPES)

puts 'Вот такие товары у нас есть:'
puts

product_collection.sort(by: :amount).each { |product| puts product }
