%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGUERRE_INNER_PRODUCT(y1, y2, xrange)
%
% Computes the inner product of two Laguerre polynomials over the supplied
% x range
%
% Inputs:   y1              first polynomial datapoints
%           y2              second polynomial datapoints
% 
% Outputs:  integral        inner product calculated through a numerical
%                           integral using the trapezium method
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function integral = laguerre_inner_product(y1, y2, xrange)
  
  product = y1 .* y2;
  integral = trapz(xrange, product);

end
