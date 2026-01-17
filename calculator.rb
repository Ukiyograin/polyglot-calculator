# Ruby - 除法计算
def divide(a, b)
  b != 0 ? a / b : Float::INFINITY
end

begin
  lines = File.readlines('input.txt')
  output = "Ruby除法:\n"
  
  lines.each_with_index do |line, index|
    numbers = line.strip.split.map(&:to_f)
    if numbers.length >= 2
      a, b = numbers[0], numbers[1]
      result = divide(a, b)
      output += "行#{index + 1}: #{a} ÷ #{b} = #{result.round(4)}\n"
    end
  end
  
  File.open('output.txt', 'a') do |f|
    f.puts output + "\n"
  end
  
  puts "Ruby除法计算完成!"
rescue => e
  puts "Ruby计算错误: #{e.message}"
end