class Rectangle
  attr_reader :left, :top, :right, :bottom
  attr_reader :area
  
  def initialize(length, x, y)
    @left = x - (length / 2)
    @top = y + (length / 2)
    @right = x + (length / 2)
    @bottom = y - (length / 2)
    
    @area = length * length
  end
  
  def intersects?(rect)
  return !(@left > rect.right || @right < rect.left || @bottom > rect.top || @top < rect.bottom)
  end
  
  # Calc common area of itself and second rectangle
  def common_area(rect)
    return 0 if (!intersects?(rect))
      
    x = 0
    if (@right > rect.left && @right < rect.right)
      x = @right - rect.left
    elsif (rect.right > @left && rect.right < @right)
      x = rect.right - @left
    end

    y = 0
    if (@top > rect.bottom && @top < rect.top)
      y = @top - rect.bottom
    elsif (rect.top > @bottom && rect.top < @top)
      y = rect.top - @bottom
    end

    return @area + rect.area - (x * y)
  end  
end


def float?(string)
  string.match(/^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/)
end

def check_length(length)
  check_coordinate(length)
  abort("Spatny vstup") unless(length.to_f >= 0)
end

def check_coordinate(length)
  abort("Spatny vstup") unless(float?(length))
end

print "Zadejte delku hrany prvniho ctverce: "
length1 = gets
check_length(length1)
length1 = length1.to_f

print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
x1 = gets
check_coordinate(x1)
x1 = x1.to_f

print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
y1 = gets
check_coordinate(y1)
y1 = y1.to_f

print "Zadejte delku hrany druheho ctverce: "
length2 = gets
check_length(length2)
length2 = length2.to_f

print "Zadejte x-ovou souradnici stredu druheho ctverce: "
x2= gets
check_coordinate(x2)
x2 = x2.to_f

print "Zadejte y-ovou souradnici stredu druheho ctverce: "
y2= gets
check_coordinate(y2)
y2 = y2.to_f

rect1 = Rectangle.new(length1, x1, y1)
rect2 = Rectangle.new(length2, x2, y2)

abort("Ctverce se ani nedotykaji.") unless (rect1.intersects?(rect2))

print "Obsah sjednoceni dvou ctvercu je " + rect1.common_area(rect2).to_s + "."