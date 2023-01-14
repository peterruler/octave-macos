[x,y] = meshgrid(-8:0.5:8);
r = sqrt(x.^2+y.^2)+eps;
z = pi.^2/16.*(sin(r)).^2./r;
surfc(z), shading flat
axis on
