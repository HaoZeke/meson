project('FortranStd', 'fortran',
    default_options: ['warning_level=0'])
# As with C and C++, each Fortran compiler + version has a subset of supported Fortran standards
# Additionally, a necessary option for non-standard Fortran projects is the "legacy"
# option, which allows non-standard syntax and behavior quirks.
# Thus "legacy" is a necessity for some old but important Fortran projects.
# By default, popular Fortran compilers disallow these quirks without "legacy" option.

fc = meson.get_compiler('fortran')

executable('stdnone', 'std95.f90')

if fc.get_id() == 'lfortran'
  # code generation error: a DO loop whose DO variable is not of integer type is not supported yet
  message('SKIP: a DO loop whose DO variable is not of integer type is not supported yet')
else
  executable('std_legacy', 'legacy.f', override_options : ['fortran_std=legacy'])
endif

executable('std_95', 'std95.f90', override_options : ['fortran_std=f95'])

executable('std_f2003', 'std2003.f90', override_options : ['fortran_std=f2003'])

executable('std_f2008', 'std2008.f90', override_options : ['fortran_std=f2008'])

if fc.get_id() == 'gcc'
  if fc.version().version_compare('>=8.0')
    executable('std_f2018', 'std2018.f90', override_options : ['fortran_std=f2018'])
  endif
else
  executable('std_f2018', 'std2018.f90', override_options : ['fortran_std=f2018'])
endif