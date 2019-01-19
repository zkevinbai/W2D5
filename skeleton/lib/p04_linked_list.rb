
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
  
  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    if @head.next == @tail && @tail.prev == @head
      true
    else 
      false
    end
  end

  def get(key)
    each do |node|
      if key == node.key 
        return node.val
      end
    end
    nil 
  end

  def include?(key)
    get(key) != nil
  end

  def append(key, val)
    new_node = Node.new(key, val)
    
    if empty?
      @head.next = new_node
      new_node.prev = @head

      @tail.prev = new_node
      new_node.next = @tail
    else
      before_tail_node = @tail.prev
      before_tail_node.next = new_node
      new_node.prev = before_tail_node

      @tail.prev = new_node
      new_node.next = @tail
    end
  end

  def update(key, val)
    each do |node|
      if key == node.key 
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if key == node.key 
        previous_node = node.prev
        next_node = node.next
        
        previous_node.next = next_node
        next_node.prev = previous_node
      end
    end
  end

  def each
    node = @head.next
    vals = []
    until node.next == nil
      #vals << node.val
      yield(node)
      node = node.next
    end
    #vals
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
