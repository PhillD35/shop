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

  break if input == 0

  if input.between?(1, product_collection.size)
    chosen_product = product_collection[input - 1]
    cart.add(chosen_product)

    puts "Вы выбрали: #{chosen_product}"
    puts
    puts "Всего товаров на сумму: #{cart.price_total}"
  end

  puts
end

puts

if cart.empty?
  puts 'Вы ничего не купили :( Возвращайтесь скорей!'
else
  puts 'Вы купили:'
  puts cart
  puts
  puts "С Вас - #{cart.price_total} руб. Спасибо за покупки!"
end
