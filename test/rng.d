module test.rng;

import std.random, std.typetuple;

alias PseudoRngTypes = TypeTuple!(MinstdRand0, MinstdRand, Mt19937, Xorshift32, Xorshift64,
                                  Xorshift96, Xorshift128, Xorshift160, Xorshift192);
