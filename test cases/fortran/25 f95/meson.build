project('fortran f95 suffix', 'fortran')

# .f95 is free-form. gfortran and LLVM flang accept the suffix.
# ifx does not, unless -free -Tf names the file. A trailing &
# continuation is a syntax error in fixed form, so this fails
# if the suffix was not forced to free form.

executable('f95free', 'main.f95')
