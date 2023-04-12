def top_words(text)
  # замінюємо всі символи окрім букв і апострофів на пробіли
  text = text.downcase.gsub(/[^a-z']/, ' ')

  # розбиваємо текст на слова та рахуємо кількість повторень кожного слова
  word_count = Hash.new(0)
  text.split.each do |word|
    # відкидаємо апострофи, які не є частиною слова
    word = word.gsub(/^'|'$/, '')
    word_count[word] += 1 if word.length > 0
  end

  # сортуємо слова за кількістю повторень та повертаємо топ-3
  word_count.sort_by {|_, count| -count}.first(3).map(&:first)
end

# Приклад використання
text = "In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."

puts top_words(text)
# => ["a", "of", "on"]
