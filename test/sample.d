module test.sample;

import std.algorithm, std.conv, std.datetime, std.random, std.range, std.stdio;

void sampleTest(Rng = void)(size_t total, size_t n, size_t repetitions, bool verbose = true)
    if(isUniformRNG!Rng || is(Rng == void))
{
    StopWatch watch;
    double[] count;

    if (verbose)
    {
        count = repeat(0.0, total).array;
    }

    write("Sampling ", n, " points from ", total, " (", to!real(n) / to!real(total),
            " of total), ", repetitions, " times, using ");

    static if (is(Rng == void))
    {
        writeln("rndGen (", typeof(rndGen).stringof, ")");
    }
    else
    {
        writeln(Rng.stringof);
    }

    watch.start;
    for (size_t i = 0; i < repetitions; ++i)
    {
        static if (is(Rng == void))
        {
            auto sample = randomSample(iota(total), n);
        }
        else
        {
            auto sample = randomSample(iota(total), n, Rng(unpredictableSeed));
        }

        foreach (s; sample)
        {
            if (verbose)
            {
                count[s]++;
            }
        }
    }
    watch.stop;

    if (verbose)
    {
        real totalCount = reduce!"a+b"(0.0, count);
        foreach (s, c; count)
        {
            writeln("\t", s, " picked ", c, " times [ ", to!real(c) / totalCount, " of total ]");
        }
    }

    real timing = to!real(watch.peek.msecs) / 1_000;

    writeln("Sampled ", n, " points from ", total, " (", to!real(n) / to!real(total),
            " of total), ", repetitions, " times in ", timing, " seconds.");
    writeln("\t[Mean time per sample: ", timing / repetitions, " seconds.]");
}
