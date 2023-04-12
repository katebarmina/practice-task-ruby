def split_pie(pie)
  n = pie.count("o") # считаем количество кусочков пирога
  rows = pie.split("\n") # разбиваем пирог на строки
  height = rows.size # определяем высоту пирога
  width = rows[0].size # определяем ширину пирога
  area_per_piece = (pie.count(".") + n) / n.to_f # определяем площадь каждого кусочка пирога
  current_area = 0
  current_piece = []
  pieces = []
  rows.each_with_index do |row, y| # перебираем каждую строку и сохраняем ее позицию
    row.chars.each_with_index do |char, x| # перебираем каждый символ в строке и сохраняем его позицию
      current_piece << char # добавляем текущий символ к текущему кусочку
      current_area += 1 if char == "o" # увеличиваем площадь текущего кусочка, если текущий символ - "o"
      if current_area == area_per_piece # если площадь текущего кусочка достигает площади каждого кусочка
        pieces << current_piece.join("").split(/(?<=\G.{#{width}})/) # добавляем текущий кусочек в список кусочков пирога и сбрасываем текущий кусочек
        current_piece = []
        current_area = 0
      elsif x == width - 1 && y == height - 1 # если мы дошли до конца пирога
        pieces << current_piece.join("").split(/(?<=\G.{#{width}})/) # добавляем последний кусочек в список кусочков пирога
      end
    end
  end
  pieces.max_by { |piece| piece[0].size } # возвращаем кусочек пирога с наибольшей шириной
end

pie = "........\n..o.....\n...o....\n........"
puts split_pie(pie)
