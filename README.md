Assassin Hexgrid
================

A hex-grid mechanic webapp for [MIT Assassins' Guild][] ten-day
games.

Originally written by [Jim Waldrop][] for the game Final Fantasy:
Yielding Stone (Spring 2008), it served as the "archives" in that game
-- a set of books linking to one another.

The code was then heavily modified by [Christian Ternus][] to act as
a "black market" for the game Thebes (IAP 2009).  In this game, the
nodes were individual merchants introducing the player to one another.

Additions I made to the code include, but are not limited to:

   * A log of actions taken 

   * The ability to plant spies on a node, which
     will reveal surrounding activity 

   * The corresponding ability to disguise oneself, with the
     appropriate ability card, of course

   * Money tracking in the interface

   * "Passwords" -- merchants can respond to certain words in
     customizable ways, enabling "market trails"

   * Automatically generated hex-grid maps of the market, customized
     per-player

   * Rumors, and the ability to squelch them

   * The ability to kill merchants

As of now (December 2012) the code has not been touched in nearly four
years.  It will likely need considerable work for your game.

The code uses [TurboGears][] to run, as well as Python imaging
libraries (I think) to generate the dynamic hexgrid maps.

If you're looking to dive in, a good place to start would be
archives/model.py, then archives/controller.py.

THIS CODE COMES WITH NO WARRANTY OR PROMISE OF FUNCTIONALITY
WHATSOEVER.  IT IS ALMOST CERTAINLY INSECURE.  IT MAY BREAK ON DAY
EIGHT, REVEAL SECRETS TO YOUR PLAYERS, COMPROMISE YOUR SERVER, AND
KICK YOUR PUPPY.  NEITHER THE AUTHORS NOR THE MIT ASSASSINS' GUILD
ASSUME ANY LIABILITY WHATSOEVER FOR ANYTHING YOU DO WITH THIS CODE.

Enjoy!

-ternus
12/12

[MIT Assassins' Guild]: http://www.mit.edu/~assassin/
[Jim Waldrop]: http://twitter.com/jlwfnord
[Christian Ternus]: http://cternus.net
[TurboGears]: http://turbogears.com