class Pencil
  attr_reader :durability

  def initialize params={}
    @durability = params[:durability] || 1000
  end

  def write text, paper
    @durability -= written_length(text)
    paper.append text
  end

  def written_length text
    text = text.gsub(/ |\n/, '')
    text.length
  end
end
