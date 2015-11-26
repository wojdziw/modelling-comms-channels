%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASIS_ONES_ALTERNATING(n)
%
% Generating a monomial basis for the Gram Schmidt polynomials calculation
% in a matrix form i.e. 1, x, x^2, x^3, ... is represented by
%  0  0  0  1
%  0  0  1  0
%  0  1  0  0
%  1  0  0  0
%
% Inputs:   n        order of the highest basis monomial   
% 
% Outputs:  ones     matrix with the monomial coefficients
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ones = basis_ones(n)

  ones = zeros(n);
  for i = 1:n
    ones(i, n-i+1) = 1;
  end
  
end