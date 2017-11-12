# Mastermind

This is my solution to the Mastermind project, as part of The Odin Project's [Ruby Programming](http://www.theodinproject.com/ruby-programming/oop) curriculum.

The file `rubymm.rb` contains the first iteration, where the player simply plays against the computer Mastermind. The second iteration, `rubymm2.rb`, includes the ability for the human player to set the code for the computer to solve. The computer solves the code in about 4-5 guesses, with a worst-case scenario of 6 guesses, as per the algorithm developed by [Donald Knuth](https://en.wikipedia.org/wiki/Mastermind_(board_game)#Five-guess_algorithm).

## Getting Started
1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems).
```bash
$ sudo apt-get install ruby-full
```
2. Fork the repository
3. Clone the repository and change into the directory
```
$ git clone [repository] [local directory name]
$ cd [local repository name]
```
4. Run the script from the directory!
```
$ ruby rubymm2.rb