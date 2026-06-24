# PSP Dynamic Libraries
Dynamic PRX libraries for PSP.


## Usage
Include whichever PRX you need into your homebrew and link against the stubs version (i.e. libpng_stub instead of libpng).
Either use load/start module routines, or use utility module loading (on ARK-4 and above).


## Reasoning
Dynamic libraries provide a few advantages compared to their statically linked counterparts, such as:
- Allows to load and offload the code on-demand, providing better memory management (the library is only loaded in RAM when actually needed).
- Allows for homebrew to be modular.
- Allows the PRX library to be updated (i.e. for bug fixes) without having to recompile the homebrew that uses it.
- Allows for various homebrew to share the same binaries.
