% Triangle function with period T. x is a vector.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generates triangle with period T, unit height at 
% origin and +/-nT, falling to zero at +/-(2n+1)T/2. 
% Takes care not to assume x(i) is between -T/2 and +T/2
% jpc 11/10/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function t = fs_weirdperiodictriangle(T,x,a)
  for i=1:length(x)
% First scale x(i) and shift to the right, 
% so v has unit period defined by the interval [0,1].
% Then if v is outside the interval, bring it inside,
% and shift back into the central position.
    v = x(i)/T + 0.5;
    v = mod(v,1) - 0.5;
% v is now definitely between -0.5 and +0.5
    if v >= a || v <= -a
      t(i) = 0;
    elseif v < 0
      t(i) = 1+v/a;  % use function definition for -ve
    else
      t(i) = 1-v/a;  % use function definition for +ve
    end
  end
