project('compiles_links_runs', 'fortran')

fc = meson.get_compiler('fortran')

code = '''error stop 123; end'''

if not fc.compiles(code)
  error('Fortran 2008 code failed to compile')
endif

# fc.run() links with an absolute -o path inside the build directory.
# A driver that splits that path on a space cannot run this test.
space_link = fc.run('program p\nend program\n', name: 'link an executable path containing a space')
if not space_link.compiled()
  errtext = ' '.join(space_link.stderr().split())
  error('MESON_SKIP_TEST: ' + errtext)
endif

if not fc.links(code)
  error('Fortran 2008 code failed to link')
endif

if fc.run(code).returncode() != 123
  error('Fortran 2008 code failed to run')
endif
