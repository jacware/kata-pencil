class Paper
  attr_reader :text

  def initialize default_text=""
    @text = default_text
  end

  def append text
    @text += text
  end

  def erase substr
    last_index = @text.rindex substr
    if last_index
      #generate a string of spaces the same length of the string being erased
      replacement = ' ' * (substr.length)
      #replace substr with string of spaces
      @text[last_index..(replacement.length+last_index-1)] = replacement
    end
  end

  def edit substr, index
    substr.split("").each_with_index do |char,i|
      pos = index + i
      if @text[pos] == ' '
        @text[pos] = char
      else
        @text[pos] = '@'
      end
    end
  end

  def reset
    @text = ""
  end
end
