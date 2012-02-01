# Class for solving the problem
class Solver
  # Node for algorithm processing
  class Node
    attr_reader :parent, :interval_id, :value
    attr_accessor :children

    def initialize(parent, value,interval_id)
      @parent = parent
      @interval_id = interval_id
      @value = value
      @children = Array.new
    end
  end
  
  # returns node with specified id
  def find_node(node, id)
    return node if node.value == id
    
    node.children.each { |child|
      found = find_node(child,id) 
      return found unless found.nil?
    }
    
    return nil
    
  end
  
  # help method for find first missing node at tree from the interval
  def find_missing(root_node, start_id, end_id)
    for i in (start_id..end_id)
      return i unless find_node(root_node, i)
    end
    return nil
  end
  
  # method for add nodes to the tree
  def add_node(root_node, start_id, end_id, interval_id)
    start_id= 0 if start_id < 0
    #this is if we cannot find any parent
    start_node = find_node(root_node, start_id)
    return nil if start_node.nil?
    
    first_missing = find_missing(root_node, start_id, end_id)
    unless first_missing.nil?
      for i in (first_missing..end_id)
        start_node.children.push Node.new(start_node,i,interval_id)
      end
      
      return end_id-first_missing
    end
    
    
    return nil
  end
  
  # solver method
  def solve(input)
    #create root node
    root = Node.new(nil, 0, nil)
    
    #generate tree
    i = 0
    input.intervals.each { |interval|
      result = add_node(root,interval.start, interval.stop, i)
      if (!result.nil? && interval.stop >= input.m)
        break
      end
      i+=1
    }
    
    #check if solution exists 
    act_node = find_node(root, input.m)
    if act_node.nil?
      return nil
    end

    # rebuild solution from the tree
    way = Array.new
    while (!act_node.interval_id.nil?)
      way.push act_node.interval_id
      act_node = act_node.parent
    end
    way.reverse!
    
    return way
  end
end
