![License](https://img.shields.io/github/license/cbrnr/XDF.jl)

XDF.jl
======
XDF.jl is an importer for [XDF files](https://github.com/sccn/xdf/wiki/Specifications) written in Julia. This packages exposes the `read_xdf` function, which handles everything needed to load the contents of XDF files, including synchronizing time stamps of different streams.

Currently, XDF.jl is not available as a Julia package yet, so the easiest way to try it out is to download the complete source code and then activate the root folder of this project in Julia, i.e. set the working directory to the root folder and activate it in the package prompt (hit `]`) with `activate .`.

## Example
Assuming that the file `minimal.xdf` is in the current working directory, loading it is as simple as:
```julia
using XDF

streams = read_xdf("minimal.xdf")
```

## Current status
This package is currently in an early stage, so here's an overview of what doesn't work (yet):

- Streams with `String` data types are not supported yet
- Time synchronization (via linear regression) is always performed, this will be changed to an optional parameter
- The complete XML headers and footers of streams are not yet available in the output
- Dejittering of streams with regular sampling rates is not available yet
- Selecting only specific streams to load does not work yet
- XDF.jl is not available as a proper Julia package yet

If you have a feature request or if you have found a bug, please open a new issue and let me know. I'd be especially interested in making the code more efficient, because this is basically my first Julia project and it might be neither idiomatic nor optimally efficient. Currently, I'm passing through the file twice: the first pass reads everything except sample chunks, whereas the second pass reads samples into preallocated arrays. I'm not sure if this is ideal, the code would be much simpler if it used just a simple pass (but then sample arrays will need to be concatenated).