require 'defuser'

puzzles = [
  { circuit: [27, nil, 39, nil], fuses: [45, 33, 44] },
  { circuit: [4, nil, nil, 10], fuses: [12, 8, 6] },
  { circuit: [1, nil, 4], fuses: [-1, 8, 2] },
  { circuit: [39, nil, 51, nil], fuses: [57, 43, 45, 61, 38] },
  { circuit: [37, nil, 41, 43, nil], fuses: [39, 46, 47, 45, 44] },
  { circuit: [85, nil, nil, 79, 79], fuses: [82, 83, 80, 84] },

  { circuit: [122, nil, nil, 15.25], fuses: [34.5, 30.5, 29.5, 61, 30.5] },

  { circuit: [57, nil, 71, nil], fuses: [75, 65, 60] },
  { circuit: [2, nil, nil, nil], fuses: [14, 40, 94, 12] },
  { circuit: [82, nil, nil, nil, 46], fuses: [68, 76, 58, 74, 79] },
  { circuit: [5, nil, nil, nil, -17, nil], fuses: [-8, -1, -2, -20, -13] },
  { circuit: [86, nil, nil, nil, 72, nil, 59], fuses: [77, 81, 75, 66, 84] },
  { circuit: [1, nil, 25, nil], fuses: [13, 57, 4, 9, 61] },
  { circuit: [75, 71, 65, nil, 47, nil, nil], fuses: [21, 73, 35, 57, 67] },
  { circuit: [3, nil, nil, 66, nil], fuses: [30, 12, 136, 138] },
  { circuit: [34, nil, nil, nil, nil, 24], fuses: [28, 30, 25, 32, 26] },
  { circuit: [75, nil, nil, nil, 63], fuses: [72, 66, 76, 70, 69, 60, 64] },
  { circuit: [6, nil, 18, 24, nil, nil], fuses: [12, 36, 16, 20, 9, 30, 22] },
  { circuit: [67, 74, nil, 88, nil], fuses: [85, 81, 95, 91, 96, 94, 77] },
  { circuit: [4, nil, nil, 60], fuses: [12, 31, 10, 28, 15, 7] },
  { circuit: [4, nil, nil, -24], fuses: [-8, -26, -1, 0, -12] },
  { circuit: [6, nil, 38, nil, 178], fuses: [84, 41, 181, 174, 40, 16] },
  { circuit: [9, nil, nil, 148], fuses: [66, 10, 70, 5, 6, 30] },
  { circuit: [2, nil, nil, -40], fuses: [-38, -4, -45, -16, -13] },

  { circuit: [4, nil, nil, nil, 154, nil], fuses: [1, 34, 14, 314, 74, 315] },
  { circuit: [70, nil, nil, nil, nil, 25, nil], fuses: [45, 61, 16, 52, 43, 34, 33] },
  { circuit: [12, nil, nil, -12, nil, nil], fuses: [-15, -4, -20, 6, -28, 4, -10] },
  { circuit: [1, nil, 17, nil, 87, 182, nil, nil], fuses: [373, 760, 40, 6, 756, 374] },
  { circuit: [78, nil, 13, 3.25, nil], fuses: [1.65, 81, 39, 11, 0.65, 41] },

  { circuit: [83, nil, nil, nil, nil, 63], fuses: [75, 79, 67, 60, 71, 82, 59] },
  { circuit: [2, 5, nil, nil, 58, nil, 248, nil], fuses: [121, 7, 12, 27, 503, 25] },
  { circuit: [4, nil, -12, nil, -82], fuses: [-1, 1, -2, -35, -11] },
  { circuit: [67, nil, nil, nil, nil, 37, nil], fuses: [69, 31, 49, 55, 62, 43, 61] },
  { circuit: [87, 91, nil, nil, 109], fuses: [86, 93, 104, 102, 94, 96] },
  { circuit: [1, nil, nil, nil, nil, 187, nil], fuses: [19, 7, 43, 379, 91, 46] },
  { circuit: [8, nil, nil, 234, nil], fuses: [701, 706, 28, 25, 235, 77] },
  { circuit: [8, nil, nil, 120, nil], fuses: [11, 53, 56, 248, 249, 24] },
  { circuit: [4, nil, nil, 88, nil], fuses: [1, 179, 40, 16, 85, 184] },
  { circuit: [63, nil, nil, 60, nil], fuses: [63, 64, 55, 56] },
  { circuit: [7, nil, nil, nil, 246, nil], fuses: [50, 514, 114, 509, 109, 20] },
]

puzzles.each do |puzzle_hash|
  puzzle = Defuser::Puzzle.new(puzzle_hash[:circuit], puzzle_hash[:fuses])
  solution = Defuser::Solver.solve(puzzle)

  puts "#{solution.series.name} #{solution.sequence.inspect}"
  puts solution.steps.map { |s| "  #{s.normalize!}" }.join("\n")
end
