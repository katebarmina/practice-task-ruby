puts "Введіть рядок: "
str = gets.chomp.downcase # отримуємо рядок від користувача та перетворюємо його на рядок з малих літер

# створюємо порожній хеш для підрахунку букв
count = Hash.new(0)

# перебираємо кожен символ у рядку та підраховуємо його
str.each_char do |c|
  if c =~ /[a-z]/ # перевіряємо, чи символ є буквою (a-z)
    count[c] += 1
  end
end

# виводимо результат
puts "Кількість кожної букви у рядку:"
count.each do |letter, count|
  puts "#{letter}-#{count}"
end