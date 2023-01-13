pkg load symbolic
setenv PYTHON /Users/peterstroessler/opt/anaconda3/bin/python
syms y
# https://ch.mathworks.com/help/symbolic/sym.zeta.html#bubjbf8-4
ezplot(abs(zeta(1/2+1i*y)),[0 30])
grid on
