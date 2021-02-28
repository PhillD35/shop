require_relative 'lib/product.rb'
require_relative 'lib/movie.rb'
require_relative 'lib/book.rb'

product_list = [
  {
    amount: 5,
    creator: 'Люк Бессон',
    price: 990,
    title: 'Леон',
    type: Movie,
    year: 1994
  },
  {
    amount: 1,
    creator: 'Юрий Быков',
    price: 390,
    title: 'Дурак',
    type: Movie,
    year: 2014
  },
  {
    amount: 10,
    creator: 'Федор Достоевский',
    genre: 'роман',
    price: 390,
    title: 'Идиот',
    type: Book
  }
]

product_list.map! { |product| product[:type].new(product) }

puts 'Вот такие товары у нас есть:'
puts

product_list.each { |product| puts product }
