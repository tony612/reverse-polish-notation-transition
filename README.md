## What's Reverse Polish notation?

http://en.wikipedia.org/wiki/Reverse_Polish_notation

## What I do

I use the Postfix algorithm in the wiki to get the result of the expression. And generate the tree based on the algorithm. Then I get the [Prefix](http://en.wikipedia.org/wiki/Polish_notation) & [Postfix](http://en.wikipedia.org/wiki/Infix_notation) expression.

## Usage

For the ruby version:

```
  ruby postfix.rb "5 1 2 + 4 * + 3 -"
```

For the java version(which I'm not good at :)):
```
  javac postfix.java
  java postfix "5 1 2 + 4 * + 3 -"
```
