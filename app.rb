require './config.rb'

paper = Paper.new

puts "Create your pencil\n"
print "Durability (integer or blank): "
durability = gets.chomp.to_integer_or_nil
print "Length (integer or blank): "
length = gets.chomp.to_integer_or_nil
print "Eraser durability (integer or blank): "
eraser_durability = gets.chomp.to_integer_or_nil

pencil = Pencil.new durability: durability,
                    length: length,
                    eraser_durability: eraser_durability

loop do
  print "\nEnter a command (print,write,sharpen,erase,edit,exit): "
  cmd = gets.chomp
  case cmd
  when "print"
    puts paper.text
  when "write"
    print "Enter text to write: "
    pencil.write gets.chomp, paper
  when "sharpen"
    pencil.sharpen
  when "erase"
    print "Enter text to erase: "
    pencil.erase gets.chomp, paper
  when "edit"
    print "Enter text to edit: "
    text = gets.chomp
    print "Enter position to insert: "
    pos = gets.chomp.to_i
    pencil.edit text,pos,paper
  when "exit"
    break
  else
    puts "Invalid command"
  end
end
