## [UNRELEASED] · YYYY-MM-DD
### ✨ Added
- Add CI workflow ([#11](https://github.com/cbrnr/XDF.jl/pull/11) by [Alberto Barradas](https://github.com/abcsds))
- Add tests for multi-channel string markers using `twochannel_string_marker.xdf` (by [Alberto Barradas](https://github.com/abcsds))
### 🌀 Changed
- Reformat sources with [Blue](https://github.com/JuliaDiff/BlueStyle) ([#12](https://github.com/cbrnr/XDF.jl/pull/12) by [Alberto Barradas](https://github.com/abcsds))
### 🐛 Fixed
- Read one varlen-prefixed string per channel for multi-channel string streams instead of broadcasting a single value across all channels (resolves [#10](https://github.com/cbrnr/XDF.jl/issues/10), by [Alberto Barradas](https://github.com/abcsds))

## [0.2.0] · 2022-02-23
### ✨ Added
- Add support for string markers and string streams ([#2](https://github.com/cbrnr/XDF.jl/pull/2) by [Alberto Barradas](https://github.com/abcsds) and [Clemens Brunner](https://github.com/cbrnr))
- Make header and footer XML available in "xml" key ([#4](https://github.com/cbrnr/XDF.jl/pull/4) by [Alberto Barradas](https://github.com/abcsds))

## [0.1.0] · 2020-09-25
### ✨ Added
- Initial release (by [Clemens Brunner](https://github.com/cbrnr))
