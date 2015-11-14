%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GramSchmidtLaguerreComparison.m
% Plots the Gram-Schmidt and Laguerre polynomials on the same plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

highest_order = 5;                            % Define the highest order of the orthogonal polynomial
xrange = (0:0.001:70);                        % X range for investigation
alpha = 0;

gm_coefficients = gs_polynomials(highest_order, xrange);  % Calculate the coefficients of the polynomials
lr_coefficients = rec_lag_polynomials(highest_order,alpha);

display(gm_coefficients);
display(lr_coefficients);

hold off;
set(gca, 'FontSize', 18);
for i = 1:highest_order+1
  y = polyval(gm_coefficients(i,:),xrange);
  axis([0,20,-80,80])
  plot(xrange, y, '-', 'LineWidth',1, 'Color', 'r'); hold on; 
end
for i = 1:highest_order+1
  y = polyval(lr_coefficients(i,:),xrange);
  axis([0,20,-80,80])
  plot(xrange, y, '-', 'LineWidth',1, 'Color', 'b'); hold on; 
end
xlabel('x'); ylabel('Normalised polynomials values');
print('-depsc', 'gm.eps'); % Save diagram as colour postscript