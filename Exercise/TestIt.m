# pkg install -forge symbolic
# sympref reset

# Always after startup when calculating symbolic, the symbolic toolbox needs to be loaded!
pkg load symbolic

# have anaconda installed first, replace with your mac account username:
setenv PYTHON /Users/peterstroessler/opt/anaconda3/bin/python

# run a symbolic calculation:

syms x
a = pi/2
f = x * cos (x)
df = diff (f)
dfh = function_handle (df)
dfh (a)
