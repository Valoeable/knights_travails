class GameBoard
    attr_accessor :board, 

    def initialize
        @board = Array.new(8) { Array.new(8,0) }
        @knightmove = [[-2, -1], [-1, -2], [1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1]].freeze
    end

    def knight_moves(start, target)
        queue = [[start]]
        visited = [start]

        until queue.empty?
            path = queue.shift
            last_pos = path.last

            return path if last_pos == target

            possible_moves(last_pos).each do |move|
                next if visited.include?(move)

                visited << move
                new_path = path + [move]
                queue << new_path
            end
        end
    end

    def possible_moves(pos)
        row, col = pos 
        moves = []

        @knightmove.each do |move|
            new_pos = [row + move[0], col + move[1]]

            if new_pos.all? { |n| n.between?(0, 7)}
                moves << new_pos
            end
        end
        moves
    end
end

k_moves = GameBoard.new
start = [3, 3]
target = [3, 4]
path = k_moves.knight_moves(start, target)
puts "Shortest path from #{start} to #{target} is #{path.inspect}"
