file = File.new(ARGV[0], "r")
move_constant = -7

while (line = file.gets)
  line.each_byte { |char| 
    print (char+move_constant).chr.to_s
  }
  puts 
end
file.close