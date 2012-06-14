## endorse is ActiveSupport for ooc

`endorse` brings a few extensions to ooc that makes it nicer
to use in day-to-day work.

### tuples

The `=>` operator is overriden to form tuples out of two expressions.

This allows all sorts of interesting constructs!

### map

`map` takes any number of tuples, and makes a map out of them:

```ooc
alphabet := map(
    "a" => "anachronic",
    "b" => "beget",
    // etc.
    "z" => "zentrum"
)
```


