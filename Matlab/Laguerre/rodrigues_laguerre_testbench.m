%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rodrigues_laguerre_testbench.m
% 
% Tests the rodrigues_laguerre function which computes the coefficients of
% the n-th Laguerre polynomial using the Rodrigues formula. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = 1;
n = 5;

coefficients = rodrigues_laguerre(n, alpha);

display(coefficients);
