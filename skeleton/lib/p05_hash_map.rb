require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
    if @count == @store.count
      resize!
      modded = key.hash % @store.count

      unless include?(key)
        @store[modded].append(key, val)
        @count += 1
      end

    else 
      modded = key.hash % @store.count

      unless include?(key)
        @store[modded] << key
        @count += 1
      end
    end
  end

  def get(key)

  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2){LinkedList.new}
    
    @store.each do |linked_list|
      linked_list.each do |node|
        modded = el % new_arr.count
        new_arr[modded].append(node.key, node.val)
      end
    end

    @store = new_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
