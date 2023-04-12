def bubble_sort(array)
  n = array.length

  # Циклічно проходимось по масиву n - 1 разів
  (n-1).times do |i|
    # Внутрішній цикл перебирає масив від початку до n - 1 - i
    (0...(n-i-1)).each do |j|
      # Якщо поточний елемент більший за наступний, міняємо їх місцями
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
    end
  end

  return array
end

# Приклад виклику функції
arr = [64, 34, 25, 12, 22, 11, 90]
puts "Масив до сортування: #{arr}"
arr = bubble_sort(arr)
puts "Масив після сортування: #{arr}"