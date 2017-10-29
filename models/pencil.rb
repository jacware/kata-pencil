class Pencil
  DEFAULT_DURABILITY = 1000
  attr_reader :durability

  def initialize params={}
    @durability = params[:durability] || DEFAULT_DURABILITY
    @original_durability = @durability
    @length = params[:length]
  end

  def write text, paper
    @durability -= written_length(text)
    if @durability < 0
      @durability.abs.times do |i|
        text[text.length-i-1] = ' '
      end
      @durability = 0
    end
    paper.append text
  end

  def sharpen
    @length -= 1 if @length
    return if @length and @length < 0
    @durability = @original_durability
  end

  def written_length text
    text = text.gsub(/ |\n/, '') #do not count whitespace
    text.length + text.uppercase_count #double count for uppercase chars
  end
end
