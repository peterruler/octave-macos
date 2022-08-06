function [A, V] = fn_cal_area_vol(r)
  % [Area, Volume] = fn_cal_area_vol(2)
  % Area = 50.265
  % Volume = 33.510
  % r is the radius of the sphere
  % A is the suface area of the sphere
  % V is the volume of the shere
  A = 4*pi*r^2;
  V = 4/3*pi*r^3;
end
