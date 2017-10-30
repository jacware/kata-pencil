class Paper
  OVERWRITE_CHAR = '@'
  attr_reader :text

  def initialize default_text=""
    @text = default_text
  end

  def append text
    @text += text
  end

  def erase substr
    last_start_index = @text.rindex substr
    if last_start_index
      replacement = ' ' * substr.length
      last_end_index = replacement.length + last_start_index - 1
      @text[last_start_index..last_end_index] = replacement
    end
  end

  def edit substr, index
    return if index < 0 or index > (@text.length - index)
    substr.split("").each_with_index do |char,i|
      char_position = index + i
      if @text[char_position] == ' '
        @text[char_position] = char
      else
        @text[char_position] = OVERWRITE_CHAR
      end
    end
  end

  def reset
    @text = ""
  end
end
