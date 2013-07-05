import std.random, std.range, std.stdio;

import test.rng, test.stats;

void main()
{
    writeln("Let's test the uniformity of random numbers produced with different RNGs.");
    size_t n = 10_000_000;

    foreach(Rng; PseudoRngTypes)
    {
        writeln("Generating ", n, " random numbers in [0, 1) with ", Rng.stringof);
        auto rng = Rng(unpredictableSeed);
        auto dist = Distribution(0.0, 100.0, 20);
        foreach(i; 0 .. n)
        {
            dist.add(uniform(0.0, 100.0, rng));
        }

        foreach(bin, h, c; dist.distribution)
        {
            writeln("\t", bin, "\t", h, "\t", c);
        }
        writeln;
    }
}
