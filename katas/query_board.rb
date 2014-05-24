<<-DOC
https://www.codeeval.com/browse/87/

Query Board

Challenge Description:

There is a board (matrix). Every cell of the board contains one integer,
which is 0 initially.

The next operations can be applied to the Query Board:
SetRow i x: it means that all values in the cells on row "i" have been changed to value "x" after this operation.
SetCol j x: it means that all values in the cells on column "j" have been changed to value "x" after this operation.
QueryRow i: it means that you should output the sum of values
on row "i".
QueryCol j: it means that you should output the sum of values on column "j".

The board's dimensions are 256x256
"i" and "j" are integers from 0 to 255
"x" is an integer from 0 to 31
"""

DOC

class QueryBoard
end

board = QueryBoard.new

board.set_col(32, 20)
board.set_row(15, 7)
board.set_row(16, 31)
Assert.equal(5118, board.query_col(32))
board.set_col(2, 14)
Assert.equal(34, board.query_row(10))
board.set_col(14, 0)
Assert.equal(1792, board.query_row(15))
board.set_row(10, 1)
Assert.equal(3571, board.query_col(2))
