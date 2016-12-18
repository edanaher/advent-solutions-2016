D = 68 = 0
L = 76 = 8
R = 82 = 14
U = 85 = 17

Let's set up 'D' minus 10 = 7*8 plus 2 to subtract out at (0)
>>++++++++>+++++++[<[-<+<+>>]<[->+<]>>-]<<< ++

Now set up 12 through 36 as the output grid:
Use (9) to store '9'; (10) to store '9' counter; (11) null at start of grid; (8) count to five
Set 9 to '9' (57 = 58 minus 1)
[->+>>>>>>>>+<<<<<<<<<]>[-<+>]<
>>>>>>>>>-
<+++++ Set (8) to 5 to count iterations

Now make 25 = 5 * 5 copies:
[
  - Decrement outer count
  >[->+>+<<]>>[-<<+>>]< Copy '9' to (10) to count up
  ->>[>]+>+>+>+>+[<]< Add 5 ones to the right side
  [->>[>]<+<+<+<+<+[<]<] And make them all '9'
  <<
]

And now let's adjust them for the grid in the rotated coordinates:
1   4   9   
  3   8         \
2   7   C   =====}  1 * 4 * 9 * 3 * 8 * 2 * 7 * C * 6 * B * 5 * A * D
  6   B         /
5   A   D

>>>> -------- 1
>> ----- 4
>> 9
>> ------ 3
>> - 8
>> ------- 2
>> -- 7
>> ++++++++++ C
>> --- 6
>> +++++++++ B
>> ---- 5
>> ++++++++ A
>> +++++++++++ D

[<]<<<<<<<<<<<

Store the current location of (1 5) in (1) and (2)
>[-]+>[-]+++++>

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

      Copy the current coordinate to (8) and (9) with (5) as temporary in case we move off grid
      >>>>>[-]>[-]<<<<<<
      <<[->>>>+>>>+<<<<<<<]>>>>[-<<<<+>>>>]<< copy x
      <[->>>+>>>>+<<<<<<<]>>>[-<<<+>>>]<< copy y

      Interpret the input character:
      Increment x and y (for if it was D)
      <+<+>>
      [ # If it wasn't D then subtract 8 to get to L and then we want to decrement x
        --------<<-->>
        [ # It wasn't L either; next up is R
          ------<--<++>>
          [ Well I guess it was U
            ---<<-->>
          ]
        ]
      ]

      Use (5) as the overflow bit; if its set we'll copy (8) (9) to x y

      Check if y (2) underflows
      >[-]<+ Set (4) to null terminator and (3) to 1 for y (2) is zero flag
      <[>-]>[>] Set (3) to zero if (2) is nonzero and leave pointer on (4)
      <[->>[-]+<<]  If (3) is one then (2) was zero so set oob flag at (5)

      >+< Set (4) to nonnull so y has null/nonnull for positioning

      Make sure y (2) didn't overflow
      < [ - [ - [ - [ - [ - [ [-] >>> [-]+ <<< ] >[<]<+> ] >[<]<+> ] >[<]<+> ] >[<]<+> ] >[<]<+> ] >[<]<

      Now swap x and y (with (3) as temporary) and do the same checks for x
      [->+<]<[->+<]>>[-<<+>>]

      Check if y (2) underflows
      >[-]<+ Set (4) to null terminator and (3) to 1 for y (2) is zero flag
      <[>-]>[>] Set (3) to zero if (2) is nonzero and leave pointer on (4)
      <[->>[-]+<<]  If (3) is one then (2) was zero so set oob flag at (5)

      >+< Set (4) to nonnull so y has null/nonnull for positioning

      Make sure y (2) didn't overflow
      < [ - [ - [ - [ - [ - [ [-] >>> [-]+ <<< ] >[<]<+> ] >[<]<+> ] >[<]<+> ] >[<]<+> ] >[<]<+> ] >[<]<

      Swap (x) and (y) back
      [->+<]<[->+<]>>[-<<+>>]

      If there was a *flow then copy 8/9 back to x/y and leave the pointer on (5)
      >>[-<<<[-]<[-]>>>>>>>[-<<<<<<<+>>>>>>>]>[-<<<<<<<+>>>>>>>]<<<<]
      >>>[-]>[-]<<<<  Clear out 8/9

      <[-] Null out (4)

      Loop management
      >>[-]+>[-]+<<<< set the eolflat at (6) and eofflag at (7)
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
    Copy y (2) to (4) then add five times it to (3) and move it back to (2)
    << [->>+<<] >>[-<+++++<+>>]
    <------ Normalize (3) so coord 1 1 goes to 0
    [->>>>>>+<<<<<<] Move (3) to (9) for convenience
    >>>>>>
    Now find the (9)th element by moving the gap
    [ - >>[>]>[-<+>]<[<]< ] Move the gap over (9) times
    >>[>]>. And print right of to the gap
    <<[[->+<]<] Move the gap back to the far left
    <<<< And move the cursor back to eolflag
    [-] Clear eolflag
  ]
  >
]

++++++++++  Print a newline
