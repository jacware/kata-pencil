class PencilKata
  def initialize pencil=nil
    @paper = Paper.new
    @pencil = pencil
  end

  def run
    setup_pencil
    loop do
      break if !command
    end
  end

  def command commands=nil
    print "\nEnter a command (print,write,sharpen,erase,edit,exit): "
    case gets_cmd commands
    when "print"
      puts @paper.text
      return @paper.text
    when "write"
      print "Enter text to write: "
      @pencil.write gets_cmd(commands), @paper
    when "sharpen"
      pencil.sharpen
    when "erase"
      print "Enter text to erase: "
      @pencil.erase gets_cmd(commands), @paper
    when "edit"
      print "Enter text to edit: "
      text = gets_cmd(commands)
      print "Enter position to insert: "
      pos = gets_cmd(commands).to_i
      @pencil.edit text,pos,@paper
    when "exit"
      return false
    else
      puts "Invalid command"
      return "Invalid command"
    end
    return true
  end

private
  def gets_cmd commands=nil
    if commands
      return commands.shift
    end
    gets.chomp
  end

  def setup_pencil
    puts "Create your pencil\n"
    print "Durability (integer or blank): "
    durability = gets.chomp.to_integer_or_nil
    print "Length (integer or blank): "
    length = gets.chomp.to_integer_or_nil
    print "Eraser durability (integer or blank): "
    eraser_durability = gets.chomp.to_integer_or_nil

    @@pencil = Pencil.new durability: durability,
                          length: length,
                          eraser_durability: eraser_durability
  end
end
