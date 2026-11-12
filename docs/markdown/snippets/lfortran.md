## LFortran

Meson detects LFortran from `lfortran --version` and uses the compiler
id `lfortran`. Shared libraries are linked with `--shared`. The
`gnu_symbol_visibility` keyword is ignored, because LFortran rejects
`-fvisibility`. `dependency('openmp')` and `dependency('coarray')` are
not found: LFortran does not link those runtimes. A C link of Fortran
objects is given `liblfortran_runtime`.
