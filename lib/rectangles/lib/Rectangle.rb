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