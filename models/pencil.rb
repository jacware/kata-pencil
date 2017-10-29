class Pencil
  attr_reader :durability, :eraser_durability

  def initialize params={}
    @durability          = params[:durability]
    @length              = params[:length]
    @eraser_durability   = params[:eraser_durability]
    @original_durability = @durability
  end

  def write text, paper
    if @durability
      #calculate len without whitespace & double the count for uppercase chars
      durability_length = text.printable_length + text.uppercase_count
      @durability -= durability_length
      if @durability < 0
        #stop writing after the durability has reached 0
        #by blanking out the rest of the string
        @durability.abs.times do |i|
          text[text.length-i-1] = ' '
        end
        @durability = 0
      end
    end
    paper.append text
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
        @durability = 0
      end
    end
    paper.erase string
  end

  def edit string, index, paper
    paper.edit string, index
  end
end
