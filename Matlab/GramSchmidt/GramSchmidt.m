%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GramSchmidt.m
% Script to calculate and plot the coefficient of the orthogonal set of
% functions using the Gram Schmidt method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
highest_order = 5;                          % Define the highest order of the orthogonal polynomial
xrange = (0:0.01:70);                        % X range for investigation

coefficients = polynomials(highest_order, xrange);  % Calculate the coefficients of the polynomials

hold off;
set(gca, 'FontSize', 18);
for i = 1:highest_order
  display(inner_product(coefficients(i,:),coefficients(i,:),xrange));
  y = polyval(coefficients(i,:),xrange);
  plot(xrange, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end

xlabel('x'); ylabel('y');
print('-depsc', 'gm.eps'); % Save diagram as colour postscript


