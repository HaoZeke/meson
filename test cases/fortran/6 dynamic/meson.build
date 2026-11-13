project('dynamic_fortran', 'fortran')

fc = meson.get_compiler('fortran')
fcid = fc.get_id()
# -Wl is one argument. A driver that pastes it into a shell command splits
# the argument on a space in the build directory. The -o path is outside
# that directory, so this probe is the -Wl split and not the -o split.
py = find_program('python3', required: false)
if py.found()
  wl_probe = run_command(py, '-c',
'''import os, subprocess, sys, tempfile
compiler, build = sys.argv[1], sys.argv[2]
td = tempfile.mkdtemp(prefix='meson-wl-')
src = os.path.join(td, 'p.f90')
out = os.path.join(td, 'p.exe')
with open(src, 'w', encoding='ascii') as handle:
    handle.write('program p\nend program\n')
result = subprocess.run(
    [compiler, src, '-o', out, '-Wl,-rpath,' + build],
    stdout=subprocess.PIPE, stderr=subprocess.PIPE,
    text=True, encoding='utf-8')
sys.stdout.write(result.stdout)
sys.stderr.write(result.stderr)
raise SystemExit(result.returncode)
''',
    fc, meson.global_build_root(),
    check: false)
  if wl_probe.returncode() != 0
    errtext = ' '.join(wl_probe.stderr().split())
    error('MESON_SKIP_TEST: ' + errtext)
  endif
endif
if fcid == 'intel-cl' or (host_machine.system() == 'windows' and fcid == 'pgi')
  error('MESON_SKIP_TEST: non-Gfortran Windows Fortran compilers do not do shared libraries in a Fortran standard way')
  # !DEC$ ATTRIBUTES DLLEXPORT must be used!
  # https://software.intel.com/en-us/node/535306
  # https://www.pgroup.com/resources/docs/19.4/x86/pgi-user-guide/index.htm#lib-dynlnk-bld-dll-fort
endif

dynamic = shared_library('dynamic', 'dynamic.f90')
exe = executable('test_exe', 'main.f90', link_with : dynamic)
test('dynamic-fortran', exe)
