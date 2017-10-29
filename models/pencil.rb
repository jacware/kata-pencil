class Pencil
  attr_reader :durability

  def initialize params={}
    @durability = params[:durability] || 1000
  end

  def write text, paper
    @durability -= text.length
    paper.append text
  end
end
