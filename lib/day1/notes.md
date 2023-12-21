# Day 1

The challenge that we've been set is to somehow parse through the input file, line by line and find the first and last digits of each line. We then need to add all of the digits to the total to get the final answer.

## Possible Solution

Use a loop to go through each line, pattern match 0-9 and put all of the digits into a list. We could then index the first (0th) and last (-1th) digits and add them to the total. We could then move onto the next line and repeat the process.

## Challenges

- How do I open the file?
- How do I read the file line by line?
- How do I pattern match the digits?
- How do I add the first and last digits to the total?

## Resources

- [File](https://hexdocs.pm/elixir/File.html)
