require 'set'

def sameword(file)
  File.open(file, "r") { |f|
    lines = f.readlines
    lines.each { |line|
      words = line.split
      word = [].to_set
      words.each {|item| 
        if (word.include?(item.upcase))
          print "Duplicated: ", item, "\n"
        else
          word.add(item.upcase)
        end}
    }
  }
end

sameword("sametest")