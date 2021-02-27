require_relative 'lib/product.rb'
require_relative 'lib/movie.rb'
require_relative 'lib/book.rb'

movie_data = {amount: 13, price: 290}

movie = Movie.new(movie_data)

puts "Фильм Леон стоит #{movie.price} руб."
