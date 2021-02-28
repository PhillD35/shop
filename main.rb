require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/product_collection'

product_collection = ProductCollection.from_dir(__dir__)

puts 'Вот такие товары у нас есть:'
puts
puts product_collection
