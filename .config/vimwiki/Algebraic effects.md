# Algebraic Effects in JavaScript

Algebraic effects, monad transformers, category theory, catamorphisms, zygomorphisms.
What do all of these words have in common?
They are all potential good sci-fi movie titles but they are also fancy words made up by mathematicians to describe some really cool concepts in functional programming.

If scooby-doo has taught me anything, it is that when you take that scary mask off the ghost, you see a normal person who does normal things. Except for the wearing scary mask part, that is a bit weird.

So, let's take the mask off this bad guy. We'll start by understanding what being effectful really means.

---

## What is an effect?
An effect is any operation in your program that is interacting with something outside your program.


---

## Problem with side effects
One of the biggest problems that developers face when working with side-effects that are not handled correctly is when writing the specs for it. Pure functions are much easier to write specs for because it doesn't interact with the environment so the assertions are just "for this input, give me this output".


---

## The haskell way of doing it
JavaScript as a language doesn't really care about whether your operation is pure or impure.
So it is left largely to the developers to find better and better ways to manage side-effects.
We can look at pure functional programming languages to get some idea as to how we can work with effects.

On the haskell side of things we will find monads and monad transformers for creating and managing side-effects.
No need to know what a monad is. I don't know what it is either.
Monads are amazing but they are a strange concept to wrap your head around.
Monads by themselves don't compose well with other types of monads. The solution to this is to use monad transformers.
Monad transformers just generalizes a given monad which makes it easier to compose with other transformed monads.


---

## Algebraic effects
This is the part of the story where the knight in shining armour comes and saves the princess. Algebraic Effects!
Algebraic effects is an alternative way to model your side-effects. Or as the famous paper by microsoft likes to call it.. "Type Directed Compilation of Row-typed Algebraic Effects"](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/08/algeff-tr-2016-v2.pdf). Swallow your panic attacks for a second, I don't understand that either.

Algebraic effects are much easier to compose than monad transformers because it abstracts the behavior out in a way that makes the composition more pure-like.

Algebraic effects as a concept is very new and has only been implemented in a few languages.
It is still a topic of research in the functional programming world.
OCaml is one of the languages that are working on pushing algebraic effects in production.
Languages like eff, koka have effects as their first-class citizens which makes their design choices very interesting.
The programs written in those languages are extremely testable.

Dan Abramov has an amazing article on it explaining what algebraic effects are. [You can read about it here](https://overreacted.io/algebraic-effects-for-the-rest-of-us/)

### What's so algebraic about it?
"Algebraic" in the pure functional world just means that they can be composed together with operations like summation and product.
Another algebraic thingy to draw parallels from is Algebraic Data Types (ADT). You can read more about [Sum types here](https://tech.shaadi.com/2019/10/22/everything-you-wanted-to-know-about-sum-types-but-were-almost-afraid-to-ask/).


### React fiber
React uses fiber to handle the rendering computations in react.
React hooks are inspired by the algebraic effects api.

### Redux saga
Algebraic-effects and redux-saga come from the same hole in functional programming.
One can say that algebraic-effects is to redux-saga what a set of bricks are to a house.
You can use algebraic effects to set up a framework that would allow you to manage side-effects in a clean way.


---

## AE library
JavaScript does not have a way to write algebraic effects out of the box but it does have generator functions that allows us to take control of the functions continuation.


---

## How to test ae programs
Programs written using algebraic effects written are pure by itself as it does not execute any effect. This makes testing it as simple as input and output.
There are 2 main ways to go about testing a composition written in algebraic effects.

### The normal way
As you can see in the example above, your behavior is a part of the input to your program.
All your effectful behavior is bundled into a single handler that is used to call your function.
This means you can use a mock test handler and call that function with pure behavior that will just result in an input and an output.
Your effectful compositions are now pure.

### The sexy way
The normal way works and it is easier to write assertions for your effects but there is one thing better. SNAPSHOTS!
As we know, effects are represented as a json structure which is later injected with effectful behavior using the repective handler. This means, your program has an input and an array of json outputs. 
You can save the generated list of json as a snapshot and boom! Your effectful code now has snapshot testing

---

## Conclusion


