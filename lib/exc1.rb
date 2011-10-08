def oddElements3(data)
  if (block_given?) 
    data.each_with_index {|item,index| if index.odd? ; yield(item); end }
  else
    out = []
    data.each_with_index {|item,index| if index.odd? ; out << item; end }
    return out
  end
end

print oddElements3([1,2,3,4,5,6]), "\n"
oddElements3([1,2,3,4,5,6]) do |x|
  puts x
end
