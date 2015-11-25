%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function laguerre_scaled_fit.m
%
% Computes a Laguerre fit to the distribution data
% Inputs:

% Outputs:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function error = fitting_error(fo, x, n, params)
  alpha = params(1);
  scale = params(2);
  
  xscaled = scale*(x-x(1))/(x(length(x))-x(1));
  laguerre = laguerre_fit(fo, xscaled, n, alpha);
 
  error = 0;
  for i = 1:length(fo)
    error = error + (fo(i)-laguerre(i))^2;
  end
  
end