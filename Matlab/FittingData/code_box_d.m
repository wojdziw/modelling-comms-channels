%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code_box_d.m
% Code box D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

sigma2 = 6; mu = 0;
nsamp = 1e4 ; nbins = 100;
[fo , x] = exp_data (sigma2, mu, nsamp, nbins);
laguerre = laguerre_fit(fo,x,10,1);

hold on;
set(gca, 'FontSize', 18);
plot(x, laguerre, '-', 'LineWidth',2, 'Color', 'red'); hold on; 
xlabel('x'); ylabel('Normalised polynomials values');