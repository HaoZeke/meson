project('compiles_links_runs', 'fortran')

fc = meson.get_compiler('fortran')
if fc.get_id() == 'lfortran'
  # fc.links() uses an absolute -o path. LFortran splits that path on a space.
  error('MESON_SKIP_TEST: clang: error: no such file or directory: f0d5a0c4ed/meson-private/tmp3zjlpnqz/output.exe')
endif

code = '''error stop 123; end'''

if not fc.compiles(code)
  error('Fortran 2008 code failed to compile')
endif

if not fc.links(code)
  error('Fortran 2008 code failed to link')
endif

if fc.run(code).returncode() != 123
  error('Fortran 2008 code failed to run')
endif
