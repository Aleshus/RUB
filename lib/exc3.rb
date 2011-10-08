def count (file)
  dict = Hash.new
  File.open(file, "r") {|f|
    lines = f.readlines
  
    lines.each { |line|

      words = line.split
      words.each{ |tmpWord|
        word = tmpWord.downcase
        if word != "." 
          if dict.has_key?(word) 
            dict[word] = dict[word] + 1 
          else
            dict[word] = 1
          end
        end
      }
    }
  }


  dict.each_pair {  |key, value|
    print( key," ",value,"\n")
  }

end

#counts word frequency
count("sametest")