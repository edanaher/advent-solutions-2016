D = 68 = 0
L = 76 = 8
R = 82 = 14
U = 85 = 17

Let's set up 'D' minus 10 = 7*8 plus 2 to subtract out at (0)
>>++++++++>+++++++[<[-<+<+>>]<[->+<]>>-]<<< ++

Store the current location of (2 2) in (1) and (2)
>[-]++>[-]++>

Put the pointer on nonzero (7) for the end_of_file test
>>>>+


For each line:
Reset the eolflag at (6) and eofflag at (7); read the input to (3); and check for eol
[
  [-]<+ Reset the eofflag at (7) and set the eolflag at (6) to start the line
  [
    [-] Reset the eolflag at (6)
    <<<,----------  Read the charater into (3) and subtract \n
    [ For each character until the newline
      <<<[->>>>+<<<<]   copy 'D' from (0) to (4)
      >>>>[-<-<<<+>>>>]< copy 'D' back to (0) and subtract it from (3)

      Interpret the input character:
      Increment y (for if it was D)
      <+>
      [ # If it wasn't D then subtract 8 to get to L and then we want to decrement x
        --------<<->->
        [ # It wasn't L either; next up is R which increments x
          ------<<++>>
          [ Well I guess it was U
            ---<<->->
          ]
        ]
      ]

      Make sure x (1) didn't underflow
      >[-]<+ Set (4) to null terminator and (3) to 1 for x (1) is zero flag
      <<[>>-]>[>] Set (3) to zero if (1) is nonzero and leave pointer on (4)
      <[-<<+>>]  If (3) is one then (1) was zero so increment it

      Make sure y (2) didn't underflow
      >[-]<+ Set (4) to null terminator and (3) to 1 for y (2) is zero flag
      <[>-]>[>] Set (3) to zero if (1) is nonzero and leave pointer on (4)
      <[-<+>]  If (3) is one then (1) was zero so increment it

      Move y (2) to (3) so we have null and nonnull next to (1)
      <[->+<]>

      Make sure x (1) didn't overflow
      <<
        - [ - [ [-] + > ] >[<]<+> ] >[<]<+
      >>

      Move y from (3) back to (2)
      [-<+>]


      Set (4) to 1 to y (2) has null/nonull
      >+<
      Make sure y (2) didn't overflow
      <
        - [ - [ [-] + > ] >[<]<+> ] >[<]<+
      >
      Reset (4)
      >[-]<

      Loop management
      >>>[-]+>[-]+<<<< set the eolflat at (6) and eofflag at (7)
      [-] Clear out the character to end the loop
    ]
    >>>
  ]

  End of line; let's print out the number we're on unless it's also eof

  Copy (7) to (6) using (5) as temporary
  [-]>[-<<+>>]<<[->+>+<<]>

  If six is set then print 

  [
    Copy x (1) to (4) then add it to (3) and move it back to (1)
    <<<<<[->>>+<<<]>>>[-<+<<+>>>]
    Copy y (2) to (4) then add thrice it to (3) and move it back to (2)
    << [->>+<<] >>[-<+++<+>>]
    <--- Normalize (3) so coord 1 1 goes to 1
  ++++++++++++++++++++++++++++++++++++++++++++++++.[-]
    >>> [-] Clear eolflag
  ]
  >
]

++++++++++  Print a newline
