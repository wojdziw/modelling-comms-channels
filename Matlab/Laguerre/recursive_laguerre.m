%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RecursiveLaguerre.m
% Script to calculate the Laguerre polynomial coefficients recursively
% using previous functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

coefficients = rec_lag_polynomials(5,0);

hold off;
set(gca, 'FontSize', 18);
xrange = -5:0.001:20;
for i = 1:5+1
  y = polyval(coefficients(i,:),xrange);
  axis([-5,20,-10,20])
  plot(xrange, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end
xlabel('x'); ylabel('Laguerre polynomials');
print('-depsc', 'gm.eps'); % Save diagram as colour postscript

display(coefficients);