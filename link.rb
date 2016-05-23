# encoding: utf-8
# программа "Блокнот"

# класс Ссылка, разновидность базового класса "Запись"
class Link < Post

  def initialize
    super # вызываем конструктор родителя
    @url = '' # инициализируем специфичное для ссылки поле
  end

  # спрашиваем 2 строки - адрес ссылки и описание
  def read_from_console
    puts "Адрес ссылки:"
    @url = STDIN.gets.chomp

    # и описание ссылки (одной строчки будет достаточно)
    puts "Что за ссылка?"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    return [@url, @text, time_string]
  end
end
