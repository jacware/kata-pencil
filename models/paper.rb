class Paper
  def initialize
    @text = ""
  end

  def text
    @text
  end

  def append text
    @text += text
  end

  def reset
    @text = ""
  end
end
