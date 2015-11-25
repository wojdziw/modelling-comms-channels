%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% laguerre_scaled_fit_test.m
% Calculates the coefficients of the scaled Laguerre fit for a randomized function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

sigma2 = 6; mu = 1000;
nsamp = 1e4 ; nbins = 100;
[fo , x] = exp_data (sigma2, mu, nsamp, nbins);

n = 10;
laguerre = laguerre_optimal_fit(fo,x,n);

% xscaled = x;
% ystr = sprintf('Exponentially distributed data (mean = %g)',sigma2);
% figure
% set(gca,'FontSize',18);
% plot(xscaled,fo,'k.','LineWidth',1.2)
% xlabel('x');
% ylabel(ystr);
% grid on
% print('-depsc',sprintf('exp_data_%g.eps',sigma2));

ystr = sprintf('Exponentially distributed data (mean = %g)',sigma2);
figure
set(gca,'FontSize',18);
plot(x,fo,'k.','LineWidth',1.2)
xlabel('x');
ylabel(ystr);
grid on
print('-depsc',sprintf('exp_data_%g.eps',sigma2));


hold on;
% figure
set(gca, 'FontSize', 18);
plot(x, laguerre, '-', 'LineWidth',2, 'Color', 'red'); hold on; 
xlabel('x'); ylabel('Normalised polynomials values');