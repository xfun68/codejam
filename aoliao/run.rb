#!/usr/bin/env ruby -w

require 'lib/framer'

framer = Framer.new

puts framer.decorate('A')
puts framer.decorate('AA')
puts framer.decorate('AA', 'BBB')
puts framer.decorate('BBB', 'AA')
puts framer.decorate('A', 'AA', 'BBB')
puts framer.decorate('BBB', 'AA', 'A')

