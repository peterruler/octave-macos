## Demo of how to use a number (which was calculated in an octave
## variable) in a symbolic calculation, without getting a warning.
pkg load symbolic
## use octave to calculate some number:
 a = pi/2

## now do some work with the symbolic pkg
# sympref diagnos syms x
 f = x * cos (x)
 df = diff (f)

## Now we want to evaluate df at a:

 # subs (df, x, a)     # this gives the "rats" warning (and gives a symbolic answer)

## So instead, try

 dfh = function_handle (df)

 dfh (a)

# ans = -1.5708


## And you can evaluate dfh at an array of "double" values:

 dfh ([1.23 12.3 pi/2])

# ans =
#  -0.82502   4.20248  -1.57080
