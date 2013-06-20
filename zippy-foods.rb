#!/usr/bin/env ruby

#       banana          apple           peach
#       Louise          Otis            Brian
#       Misty           Susan           Chase
#       Michael                         Dan
#                                       Jessica

foods = {
  :banana => %w{ Louise Misty Michael },
  :apple => %w{ Otis Susan },
  :peach => %w{ Brian Chase Dan Jessica },
}

headings = foods.keys.sort
sorted_names = headings.map { |k| foods[k] }
# Need to add padding to the receiver of .zip() or it might drop rows.
padding = Array(1 .. sorted_names.map(&:size).max)
rows = padding.zip(*sorted_names).map { |pad_names| pad_names.drop(1) }

puts headings.join("\t")
rows.each do |row|
  puts row.join("\t")
end
