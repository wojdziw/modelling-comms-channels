%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GramSchmidtLaguerreComparison.m
% Calculates the coefficients of the associated set of Laguerre functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function a_laguerres = associated_laguerre(highest_order, alpha, xrange)

lr_coefficients = rec_lag_polynomials(highest_order,alpha);
a_laguerres = zeros([highest_order+1 length(xrange)]);

for i = 1:highest_order+1
  order = i-1;
  scale = sqrt(gamma(order+1)/gamma(order+1+alpha));
  lr_coefficients(i,:) = lr_coefficients(i,:)*scale;
  a_laguerres(i,:) = polyval(lr_coefficients(i,:),xrange) .* exp(-xrange/2) .* xrange .^(alpha/2);
end

  
