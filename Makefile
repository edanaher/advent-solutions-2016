1a:
	awk -f day01a.awk

1b:
	awk -f day01b.awk

# https://github.com/FabianM/brainfuck.git
2a:
	brainfuck -f day02a.bf

2b:
	brainfuck -f day02b.bf

# dc doesn't have file input, but it can take multiple files, one of which can be stdin :)
3a:
	dc -f - -f day03a.dc

3b:
	dc -f - -f day03b.dc

# http://www.golfscript.com/golfscript/index.html
4a:
	golfscript.rb day04a.golf

4b:
	golfscript.rb day04b.golf | grep -i north
