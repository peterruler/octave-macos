x = [1 2 6];
y = [2 4 1];
plot(x,y , 'or', 'MarkerSize', 12)
grid on
grid off
grid on
xlabel('x-Achse')
ylabel('y-Achse')
title('plot y vs x')
set(gca, 'fontsize', 24)
axis([0 7 0 5])

% with fplot
f = @(x) 0.5*x + 1;
% fplot(f,[-3 0])
grid on

% with linspace
x1 = linspace(-2,2,5);
x2 = linspace(0,2,30);
y1 = 0.5*x1 + 1;
y2 = x2.^2;

length(x1)
length(y1)
plot(x1,y1)
plot(x1,y1, 'bo-',x2,y2,'rx:')
grid on
title('plot y vs x')
set(gca, 'fontsize', 24)
xlabel('x-Achse')
ylabel('y-Achse')

% Winkelfunktionen
x1 = linspace(-2*pi, 2*pi);
x2 = linspace(-pi,2*pi);
y1 = cos(x1);
y2 = cos(x2).^2;
plot(x1, y1, 'b-', x2, y2, 'r:')
grid on
title('plot y vs x')
set(gca, 'fontsize', 24)
set(gca, 'fontsize', 24, 'XTick', [-2*pi -pi 0 pi 2*pi])
set(gca, 'XTickLabel', {'-2\pi', '\pi','0','\pi', '2\pi'})
axis([-2*pi 2*pi -1 1])
xlabel('Variable x')
ylabel('VAriable y')


#symbolic
setenv PYTHON /Users/peterstroessler/opt/anaconda3/bin/python
pkg load symbolic

syms x
