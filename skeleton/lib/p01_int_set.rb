class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if include?(num)
    elsif num > @store.count || num < 0
      raise "Out of bounds"
    else
      @store[num] = num
    end

  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    if @store.include?(num)
      true
    else
      false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    modded = num % @store.count

    unless include?(num)
      @store[modded] << num
    end
  end

  def remove(num)
    @store.each do |bucket|
      if bucket.include?(num)
        bucket.delete(num)
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

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == @store.count
      resize!
      modded = num % @store.count

      unless include?(num)
        @store[modded] << num
        @count += 1
      end
    else 
      modded = num % @store.count

      unless include?(num)
        @store[modded] << num
        @count += 1
      end
    end
  end

  def remove(num)
    @store.each do |bucket|
      if bucket.include?(num)
        bucket.delete(num)
        @count -= 1
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
