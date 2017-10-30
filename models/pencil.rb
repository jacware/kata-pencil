class Pencil
  attr_reader :durability, :eraser_durability

  def initialize params={}
    @durability          = params[:durability]
    @length              = params[:length]
    @eraser_durability   = params[:eraser_durability]
    @original_durability = @durability
  end

  def write text, paper
    paper.append text_after_durability_check(text)
  end

  def sharpen
    @length -= 1 if @length
    return if @length and @length < 0
    @durability = @original_durability
  end

  def erase string, paper
    if @eraser_durability
      @eraser_durability -= string.printable_length
      #if the durability is less then 0 then only erase the amount available
      if @eraser_durability < 0
        string = string[@eraser_durability.abs..string.length]
        @eraser_durability = 0
      end
    end
    paper.erase string
  end

  def edit text, index, paper
    paper.edit text_after_durability_check(text), index
  end

private
  def text_after_durability_check text
    if @durability
      @durability -= text.printable_length + text.uppercase_count
      if @durability < 0
        @durability.abs.times {|i| text[text.length-i-1] = ' '}
        @durability = 0
      end
    end
    text
  end
end
