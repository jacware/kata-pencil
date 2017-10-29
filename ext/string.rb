class String
  def lowercase?
    return false if self.size > 1
    ('a'..'z').include? self
  end

  def uppercase?
    return false if self.size > 1
    ('A'..'Z').include? self
  end

  def lowercase_count
    count = 0
    self.split("").each do |char|
      count += 1 if char.lowercase?
    end
    count
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
end
