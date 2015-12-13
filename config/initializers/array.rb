class Array
  # # The .twos method should return two arrays split right in the middle.
  # # If the size of the array is odd, then the median goes to the first array.
  # # This version of the .twos method changes the value of self.
  # def twos
  #   amount = self.size/2
  #   other = self.pop amount
  #   return self, other
  # end
  #
  # def fours
  #   other = self.pop self.size/3
  #   one, two, three, four = self.twos + other.twos
  #   return one, two, three, four
  # end
  #
  # The .twos and .fours method are used for splitting up an array of a
  # project's technologies so that it can be both desktop & mobile friendly.
  #
  # The two methods above worked fine, but I didn't like how the .pop method
  # changed the original array.
  #
  # So I wrote the .pops method, which is like the .pop method, except it does
  # not change the value of the array, and it returns both sides of the
  # sub-array, instead of just one.

  # This version of the .twos method takes advantage of the .pops method, and it's a one-liner!
  def twos
    self.pops self.size/2
  end

  # This version of the .fours method uses both the pops and twos method. Super clean.
  def fours
    left, right = self.pops self.size/3
    left.twos + right.twos
  end

  # Returns the first part of the array and the array the would originally be
  # returned by the .pop method.
  # This method does not affect the array it was called on, unlike .pop
  def pops num
    if num == 0
      return self, []
    end
    one = 0
    two = -num - 1
    three = -num
    four = -1
    left, right = self[one..two], self[three..four]
  end
end
