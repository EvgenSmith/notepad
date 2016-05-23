# encoding: utf-8
# программа "Блокнот", демонстрирующая как эффективно наследовать классы в ruby
# версия 0.2, использующая классы Post, Memo, Link & Task

# xxx/ этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /xxx

# подключаем класс Post и его детей
require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

puts "Привет, я твой блокнот!"

# Теперь надо спросить у пользователя, что он хочет создать
puts "Что хотите записать в блокнот?"

# массив возможных видов Записи (поста)
choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size # пока юзер не выбрал правильно
  # выводим заново массив возможных типов поста
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.chomp.to_i
end

# выбор сделан, создаем запись с помощью стат. метода класса Post
entry = Post.create(choice)

# просим пользователя ввести пост (каким бы он ни был)
entry.read_from_console

# сохраняем пост в файл
entry.save

puts "Ваша запись сохранена!"
