# uniform
# deterministic
# one way
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  MAGIC_NUMBER = 666
  def hash
    return 0 if self.empty?
    holder = []
    self.each_index do |i|
      if i < self.length-1
        xored = self[i].object_id ^ self[i+1].object_id
        added = self[i].object_id + self[i+1].object_id
        multiply = self[i].object_id * self[i+1].object_id
        combo = xored ^ added ^ multiply
        holder << combo
      else 
        xored = self[i].object_id ^ MAGIC_NUMBER.object_id
        holder << xored
      end
    end
    holder.reduce {|acc, el| acc ^ el }
  end
end


class String
  def hash
    arr = self.chars.to_a.map {|char| char.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # 0
    mykeys = self.keys.map {|char| char.ord unless char.class == Symbol}
    myvals = self.values.map {|char| char.ord}
    both = mykeys.sort + myvals.sort
    both.hash
  end
end
