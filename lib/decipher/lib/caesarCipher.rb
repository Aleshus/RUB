class CaesarCipher

  def self.decode(text)
    
    move_constant = -7
    output = ""

    text.each_byte { |char| 
      output += (char+move_constant).chr.to_s
    }
    return output

  end
  
end