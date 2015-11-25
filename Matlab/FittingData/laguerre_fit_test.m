%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% laguerre_fit_test.m
% Calculates the coefficients of the Laguerre fit for a randomized function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

[fo, x] = exp_data(2, 3+2i, 10000, 100);
laguerre = laguerre_fit(fo,x,5,0);

hold on;
set(gca, 'FontSize', 18);
plot(x, laguerre, '-', 'LineWidth',2, 'Color', 'red'); hold on; 
xlabel('x'); ylabel('Normalised polynomials values');

estimated_mean = trapz (x , x .* fo );
parameterised_fit = (1/estimated_mean)*exp(-x/estimated_mean);

error = trapz(x, (laguerre - parameterised_fit).^2);
display(error);

hold on;
ystr = sprintf('Exponentially distributed data');
set(gca,'FontSize',18);
plot(x,fo,'k.','LineWidth',1.2)
xlabel('x');
ylabel(ystr);
grid on
print('-depsc',sprintf('exp_data_%g.eps',sigma2));

% hold on;
% set(gca, 'FontSize', 18);
% plot(x, parameterised_fit, '-', 'LineWidth',2, 'Color', 'blue');
% xlabel('x'); ylabel('Normalised polynomials values');
