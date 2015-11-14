%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GramSchmidtLaguerreComparison.m
% Calculates the coefficients of the associated set of Laguerre functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

highest_order = 5;                            % Define the highest order of the orthogonal polynomial
xrange = (0:0.0001:70);                        % X range for investigation
alpha = 0.2;

a_laguerres = associated_laguerre(highest_order, alpha, xrange);

hold off;
set(gca, 'FontSize', 18);
for i = 1:highest_order+1
  y = a_laguerres(i, :);
  axis([0, 40, -1, 1])
  plot(xrange, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end
xlabel('x'); ylabel('Normalised polynomials values');
print('-depsc', 'gm.eps'); % Save diagram as colour postscript

% Verifying orthonormality
for i = 1:highest_order
  for j = i:highest_order
    prod = laguerre_inner_product(a_laguerres(i,:), a_laguerres(j,:), xrange);
    display([i j prod]);
  end
end

  
