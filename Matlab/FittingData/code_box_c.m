%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code_box_c.m
% Calculates the coefficients of the Laguerre fit for a randomized function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

sigma2 = 1/3; mu = 1 + sqrt (-1);
nsamp = 1e4 ; nbins = 100;
[fo , x] = exp_data (sigma2, mu, nsamp, nbins);
laguerre = laguerre_fit(fo,x,5,2);

