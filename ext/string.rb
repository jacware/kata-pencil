class String

  def uppercase?
    return false if self.size > 1
    ('A'..'Z').include? self
  end

  def uppercase_count
    count = 0
    self.split("").each do |char|
      count += 1 if char.uppercase?
    end
    count
  end

  def printable_length
    self.gsub(/ |\n/, '').length
  end

  def to_integer_or_nil
    if self == '' or self.nil? or self.to_i.to_s != self
      return nil
    else
      return self.to_i
    end
  end
end
