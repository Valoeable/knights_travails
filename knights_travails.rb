class GameBoard
    attr_accessor :board

    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
    end

end

class Knight
    attr_accessor :children, :parent, :position

    KNIGHTMOVE = [[1, 2], [-2, -1], [-1, 2], [2, -1], [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze


    def initialize(pos, parent = nil)
        @pos = pos
        @parent = parent
        @children = []
    end

    def reposition
        knight_reposition = KNIGHTMOVE.map do |move|
            move.each_with_index.map { |j, i| j + @pos[i] unless (j + @pos[i]).negative? || (j + @pos[i]) > 7 }
        end
        knight_reposition.delete_if { |move| move.include?(nil) }
    end
end
