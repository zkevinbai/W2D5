class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == @store.count
      resize!
      modded = key.hash % @store.count

      unless include?(key)
        @store[modded] << key
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

  def include?(num)
    @store.each do |bucket|
      bucket.each do |el|
        return true if num == el
      end
    end
    false
  end



  
  def remove(num)
    @store.each do |bucket|
      if bucket.include?(num)
        bucket.delete(num)
        @count -= 1
      end
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2){[]}
    
    @store.each do |bucket|
      bucket.each do |el|
        modded = el % new_arr.count
        new_arr[modded] << el
      end
    end

    @store = new_arr
  end
end
