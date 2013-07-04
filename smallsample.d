import std.stdio;
import test.sample;

void main()
{
    writeln("Let's test sampling from a small set.");
    writeln;

    sampleTest(10, 5, 1_000_000, true);
    writeln;
    foreach (Rng; PseudoRngTypes)
    {
        sampleTest!Rng(10, 5, 1_000_000, true);
        writeln;
    }
}
