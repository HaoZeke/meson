## LFortran

Meson detects LFortran from `lfortran --version` and uses the compiler
id `lfortran`. Shared libraries are linked with `--shared`. The
`gnu_symbol_visibility` keyword is ignored, because LFortran rejects
`-fvisibility`. `dependency('openmp')` is found only when `--openmp --cpp`
defines `_OPENMP` and `omp_get_num_threads` links. `dependency('coarray')`
is found only when `this_image`, `num_images` and `sync all` link.
A C link of Fortran objects is given `liblfortran_runtime`.
