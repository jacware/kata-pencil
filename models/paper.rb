class Paper
  def initialize default_text=''
    @text = default_text
  end

  def text
    @text
  end

  def append text
    @text += text
  end

  def erase substr
    last_index = @text.rindex substr
    if last_index
      replacement = ' ' * (substr.length)
      @text[last_index..(replacement.length+last_index-1)] = replacement
    end
  end

  def edit substr, index
    substr.split('').each_with_index do |char,i|
      @text[index+i] = char
    end
  end

  def reset
    @text = ""
  end
end
