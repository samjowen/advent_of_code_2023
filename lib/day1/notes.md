# Day 1

Part I:

The challenge that we've been set is to somehow parse through the input file, line by line and find the first and last digits of each line. We then need to add all of the digits to the total to get the final answer.

Part II:

Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and last digit on each line. For example:

## Possible Solution

Use a loop to go through each line, pattern match 0-9 and put all of the digits into a list. We could then index the first (0th) and last (-1th) digits and add them to the total. We could then move onto the next line and repeat the process.

## Challenges

- How do I open the file?
- How do I read the file line by line?
- How do I pattern match the digits?
- How do I add the first and last digits to the total?

## Resources

- [File](https://hexdocs.pm/elixir/File.html)

### Solution

```elixir
iex(1)> AdventOfCode2023.day1_solve()
56049
```

Answer: 56049

That's the right answer! You are one gold star closer to restoring snow operations.
