class String
  def lowercase?
    self == self.downcase
  end

  def uppercase?
    self == self.upcase
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
end
