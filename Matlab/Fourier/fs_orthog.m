%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function fs_orthog.m
% DWM 5/9/10
%
% Integrates fourier basis functions over a period
% eg \int cos(m w x)  sin(n w x) dx
% using trapezium rule and returns scalar result
% Inputs:
% T        period
% nint     no of intervals
% m,n      harmonics
% code     'cc', 'cs', 'ss', 'sc'
%          indicates cos(m w x) * cos(n w x) etc 
% Outputs: result (a scalar)
%          codeok =1 if ok, =0 if bad code        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [result,codeok] = fs_orthog(T,nint,m,n,code)

  codeok = 1;                 % assume code is ok until ...
  w      = 2*pi/T;            % Derive omega
  x      = (-T/2:T/nint:T/2); % Make the  vector of x values

  if code(1) == 'c'           % Is the first code cos?
    v1 = cos(m*w*x);          % Yes. Hence cos (m w x)
  elseif code(1) == 's'       % No. Is is sin?
    v1 = sin(m*w*x);          % Yes. hence sin (m w x)
  else                        % Is it neither c nor s? 
    codeok = 0;               % Must be a bad code
  end

  if code(2) == 'c'           % Is the second code cos?
    v2 = cos(n*w*x);          % Yes. Hence cos (n w x)
  elseif code(2) == 's'       % etc 
    v2 = sin(n*w*x);           
  else
    codeok = 0;               
  end

  if codeok == 1               % Only integrate if code is ok    
    result = trapz(x,v1.*v2)/T;% Trapzm rule integrates prods
  else
    result = 999;              % return a silly result
  end
