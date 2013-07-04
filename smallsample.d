import std.stdio;
import test.sample;

void main()
{
    writeln("Let's test the random sample functionality with small samples.");
    writeln;

    sampleTest(10, 5, 1_000_000, true);
    writeln;
    foreach (Rng; PseudoRngTypes)
    {
        sampleTest!Rng(10, 5, 1_000_000, true);
        writeln;
    }

/*    writeln("Now with bigger samples.");

    writeln("Test 0.");
    sampleTest(100, 5, 1_000_000, true);
    i = 1;
    foreach(Rng; PseudoRngTypes)
    {
        writeln("Test ", i, ".");
        ++i;
        sampleTest!Rng(100, 5, 1_000_000, true);
    }*/
}
