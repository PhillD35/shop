require_relative 'lib/product.rb'
require_relative 'lib/movie.rb'
require_relative 'lib/book.rb'

PRODUCTS = ObjectSpace
           .each_object(Class)
           .select { |object| object.superclass == Product }


movies = Dir['data/movies/*txt', base: __dir__]
books = Dir['data/books/*txt', base: __dir__]

movies.map! { |movie| Movie.from_file(movie) }
books.map! { |book| Book.from_file(book) }

product_list = movies + books

# product_list.map! { |product| product[:type].new(product) }

puts 'Вот такие товары у нас есть:'
puts

product_list.each { |product| puts product }
