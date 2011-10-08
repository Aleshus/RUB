# Problem from http://www.spoj.pl/problems/TDBFS/

# class representing one node of the graph
class Node
  attr_reader :value
  attr_reader :neighbors
  
  def initialize(value)
    @neighbors = Array.new
    @neighbors.push(self)
    @value = value
  end
  
  def add_adj(node)
    @neighbors.push(node)
  end
end

# graph class - has several nodes
class Graph
  attr_accessor :nodes
  
  def initialize(size)
    @nodes = Array.new(size)
    
    (0..size).each do |i|
      @nodes[i] = Node.new(i)
    end
  end
end


t = gets.to_i # t is number of graphs

(1..t).each { |graphID|
  n = gets.to_i # n is count of nodes at graph
  
  # create a new graph
  graph = Graph.new(n)
  
  (1..n).each do |nodeID| 
    numbers = gets.split;
    id = numbers[0].to_i; 
    num = numbers[1].to_i
    (1..num).each do
      |adjID| adjVal = numbers[adjID+1].to_i; 
      graph.nodes[id].add_adj(graph.nodes[adjVal]) 
    end
  end
  
# we process graph immediately
puts "graph #{graphID}" 
  
  
while true do
  numbers = gets.split
  start_node = numbers[0].to_i
  type = numbers[1].to_i
    
  # stop proceed while we got two zeros
  break if start_node == 0 and type == 0
    
    
  # visited is for sign which nodes was visited
  visited = Array.new(graph.nodes.size(),false)
  # number of visited nodes
  visited_count = 0
      
  # to this array will be genearted next path 
  # it simulates stack or queue
  nextpath = Array.new
  nextpath.push(graph.nodes[start_node])
  visited[start_node] = true
      
  # infinity loop, but we ends while no nodes are at array
  while true do
    # pop or shift - simulating stack or queue
    type == 0 ? node = nextpath.pop : node = nextpath.shift
    break if node == nil # this stop infinity loop
        
    # lets talk
    print " " if visited_count > 0
    print node.value
        
       
    visited_count += 1
    # optimalization
    break if visited_count == graph.nodes.size
        
      
    new_path = Proc.new { |nextnode| 
      if (visited[nextnode.value] == false)
        nextpath.push(nextnode)
        visited[nextnode.value] = true   #set visited for actual
      end
    }
      
    # push succ
    if type == 0 
      node.neighbors.reverse_each { |succ| new_path.call(succ)  } 
    else 
      node.neighbors.each { |succ| new_path.call(succ)  } 
    end     
  end
      
  puts
    
end
}