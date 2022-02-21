![License](https://img.shields.io/github/license/cbrnr/XDF.jl)

XDF.jl
======
XDF.jl is an importer for [XDF files](https://github.com/sccn/xdf/wiki/Specifications) written in Julia. This package exposes the `read_xdf` function, which handles everything needed to load the contents of XDF files (including synchronization of different streams).

## Installation
Use the package manager to add XDF.jl by typing `] add XDF` in the Julia REPL.

## Example
Assuming that the file `minimal.xdf` is in the current working directory, loading it is as simple as:
```julia
using XDF

streams = read_xdf("minimal.xdf")
```

## Current status
This package is currently in an early stage, so here's an overview of what doesn't work (yet):

- [x] Streams with `String` data types are not supported yet
- [ ] Time synchronization (via linear regression) is always performed, this will be changed to an optional parameter
- [ ] The complete XML headers and footers of streams are not yet available in the output
- [ ] Dejittering of streams with regular sampling rates is not available yet
- [ ] Loading only specific streams does not work yet

If you have a feature request or found a bug, please open a new issue and let me know. I'd be especially interested in making the code more efficient, because this is basically my first Julia project. Currently, the function is passing through the file twice: the first pass reads everything except sample chunks, whereas the second pass reads samples into preallocated arrays. I'm not sure if this is ideal, the code would be much simpler if it used just a simple pass (but then sample arrays will need to be concatenated).
