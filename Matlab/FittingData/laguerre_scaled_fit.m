%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function laguerre_scaled_fit.m
%
% Computes a Laguerre fit to the distribution data
% Inputs:

% Outputs:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = laguerre_scaled_fit(fo, x, n, alpha, scale)

  xscaled = scale*(x-x(1))/(x(length(x))-x(1));

  result = laguerre_fit(fo,xscaled, n, alpha);
    
end