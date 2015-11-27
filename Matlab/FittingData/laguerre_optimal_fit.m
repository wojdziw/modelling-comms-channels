%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGUERRE_OPTIMAL_FIT(fo, x, n)
%
% Computes an optimal Laguerre fit to the exponentially distributed data
% (randomly generated), with alpha and x-scaling parameters being optimally
% found using the fminsearch function.
%
% Inputs:   fo       values of the function being fitted
%           x        domain of the function being fitted
%           n        highest order of the Laguerre polynomial being used
% 
% Outputs:  result   the vector of values of the Laguerre fit
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = laguerre_optimal_fit(fo, x, n)

  % Initial estimates for the values of alpha and x-scale
  alpha_guess = 5;
  % alpha_guess = 0; <- look into that
  scale_guess = 10;

  % Optimisation of alpha and scale using fminsearch
  params = fminsearch(@(params) fitting_error(fo, x, n, params), [alpha_guess, scale_guess]);
  
  alpha = params(1);
  scale = params(2);
  
  % Computing the fit based on the optimally scaled domain and optimised alpha
  xscaled = scale*(x-x(1))/(x(length(x))-x(1));
  result = laguerre_fit(fo, xscaled, n, alpha);
    
end
