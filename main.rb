require_relative 'lib/cart'
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/movie'
require_relative 'lib/product_collection'

product_collection = ProductCollection.from_dir(__dir__)
cart = Cart.new

loop do
  puts 'Вот такие товары у нас есть:'
  puts
  puts product_collection
  puts '0. Выход'

  puts
  print 'Ваш выбор: '
  input = STDIN.gets.to_i

  break if input.zero?

  chosen_product = product_collection[input]

  next if chosen_product.nil?

  cart.add(chosen_product)

  puts "Вы выбрали: #{chosen_product}"
  puts
  puts "Всего товаров на сумму: #{cart.total}"

  puts
end

puts

if cart.empty?
  puts 'Вы ничего не купили :( Возвращайтесь скорей!'
else
  puts 'Вы купили:'
  puts cart
  puts
  puts "С Вас - #{cart.total} руб. Спасибо за покупки!"
end
