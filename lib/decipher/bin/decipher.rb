require './lib/caesarCipher'

file = File.new(ARGV[0], "r")

while (line = file.gets)
  puts CaesarCipher.decode(line)
end

file.close