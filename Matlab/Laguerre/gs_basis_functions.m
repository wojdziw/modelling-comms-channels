%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function monomials.m
%
% Computes the matrix of monomials given the required order.
% Inputs:
% highest_order    order
% Outputs:
% Matrix with the coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ones = gs_basis_functions(highest_order)
  ones = zeros(highest_order);
  for i = 1:highest_order
    ones(i, highest_order-i+1) = 1*(-1)^(i+1);
  end