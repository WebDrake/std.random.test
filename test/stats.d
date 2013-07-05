module test.stats;

import std.algorithm, std.conv, std.exception, std.math, std.range;

struct Distribution
{
    private real _min, _max;
    private real[] _bins, _cbins;
    private size_t _count;

    this(real mn, real mx, size_t n)
    {
        _min = mn;
        _max = mx;
        _bins.length = n;
        _bins[] = 0;
        _cbins.length = n;
        _cbins[] = 0;
        _count = 0;
    }

    void add(real x)
    {
        enforce(_min <= x);
        enforce(x < _max);
        size_t bin = to!size_t(floor(_bins.length * (x - _min) / (_max - _min)));
        ++_bins[bin];
        ++_cbins[bin .. $];
        _count++;
    }

    auto distribution() @property
    {
        auto hist = map!(a => _bins[a] / _count)(iota(_bins.length));
        auto cd = map!(a => _cbins[a] / _count)(iota(_cbins.length));
        auto bins = map!(a => ((a + 1) * (_max - _min) / _bins.length) + _min)(iota(_bins.length));
        return zip(bins, hist, cd);
    }
}
