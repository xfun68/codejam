#! /usr/bin/ruby -I lib

require 'lib/framer'

def split_line(opts={})
  puts opts.fetch(:padding, '#') * opts.fetch(:size, 25)
end

framer = Framer.new

first_box = Box.new framer.decorate("aa", "bbb")
second_box = Box.new framer.decorate("xyz", "x")

split_line :padding => '~', :size => 70

puts first_box.to_a

split_line

puts second_box.to_a

split_line

puts first_box.append(second_box).to_a

split_line

puts framer.decorate first_box.append(second_box).to_a

split_line

puts framer.decorate first_box.shift(second_box).to_a

split_line

puts framer.decorate first_box.stack(second_box).to_a

split_line

puts framer.decorate first_box.jack(second_box).to_a

split_line

decorated_frist_box = Box.new(framer.decorate(first_box.to_a))
puts framer.decorate decorated_frist_box.append(second_box).to_a

split_line

puts framer.decorate decorated_frist_box.shift(Box.new("ABCDEF")).to_a

split_line

puts framer.decorate decorated_frist_box.shift(Box.new("ABCDEF", "Z")).to_a

split_line :padding => '~', :size => 70
