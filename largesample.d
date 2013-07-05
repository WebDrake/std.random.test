import std.random, std.stdio;
import test.rng, test.sample;

void main()
{
    writeln("Let's test sampling from a larger set.");
    writeln;

    sampleTest(100, 5, 1_000_000, true);
    writeln;
    foreach (Rng; PseudoRngTypes)
    {
        static if(!is(Rng == Xorshift32))
        {
            sampleTest!Rng(100, 5, 1_000_000, true);
        }
        writeln;
    }
}
