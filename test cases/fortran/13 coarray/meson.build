project('Fortran coarray', 'fortran',
  meson_version: '>=0.50')

fc = meson.get_compiler('fortran')

if fc.get_id() == 'lfortran'
  # Probe the dependency so a missing runtime is reported as not-found.
  coarray_probe = dependency('coarray', required: false)
  if not coarray_probe.found()
    error('MESON_SKIP_TEST: Coarray support not available: LFortran does not link a coarray runtime.')
  endif
endif
if ['pgi', 'flang'].contains(fc.get_id())
  error('MESON_SKIP_TEST: At least through PGI 19.10 and Flang 7.1 do not support Fortran Coarrays.')
endif

# coarray is required because single-image fallback is an intrinsic feature
coarray = dependency('coarray')

# check coarray, because user might not have all the library stack installed correctly
# for example, conflicting library/compiler versions on PATH
# this has to invoke a run of "sync all" to verify the MPI stack is functioning,
# particularly for dynamic linking
coarray_run = fc.run('sync all; end', dependencies: coarray, name: 'Coarray link & run')
if coarray_run.returncode() != 0
  errtext = ' '.join(coarray_run.stderr().split())
  reason = 'coarray stack (including MPI) did not link correctly so that a simple test could run.'
  if errtext != ''
    reason += ' ' + errtext
  endif
  error('MESON_SKIP_TEST: ' + reason)
endif

exe = executable('hello', 'main.f90',
  dependencies : coarray)

test('Coarray hello world', exe, timeout: 10)
