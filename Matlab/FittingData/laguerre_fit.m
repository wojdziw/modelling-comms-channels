%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function rec_lag_polynomials.m
%
% Computes a Laguerre fit to the distribution data
% Inputs:

% Outputs:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = laguerre_fit(Y, X, order, alpha)

  lag_values = associated_laguerre(order, alpha, X);
  coefs = zeros(1,order+1);
  
  for i = 1:order+1
    product = laguerre_inner_product(lag_values(i,:), Y, X);
    coefs(i) = product;
  end
  
  result = coefs * lag_values;
  
  display(coefs);
  
  hold on;
  set(gca, 'FontSize', 18);
  plot(X, result, '-', 'LineWidth',2, 'Color', 'red'); hold on; 
  xlabel('x'); ylabel('Normalised polynomials values');
  print('-depsc', 'gm.eps'); % Save diagram as colour postscript
  
  end
