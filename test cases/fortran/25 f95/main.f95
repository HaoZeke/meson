program f95_free
  integer :: value
  value = 1 &
       + 2
  if (value /= 3) stop 1
  print *, 'f95 free form ok'
end program f95_free
