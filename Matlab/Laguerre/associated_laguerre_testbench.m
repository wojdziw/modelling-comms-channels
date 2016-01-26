%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% associated_laguerre_testbench.m
% 
% Tests the associated_laguerre function which computes the values of the
% associated Laguerre polynomial values for a given x-range as well as the
% n and alpha parameters.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

n = 5;
x = 0:0.0001:70;
alpha = 5;

% Computing the values of the associated Laguerre functions
a_laguerres = associated_laguerre(n, alpha, x);

% Plotting
for row = 1:n+1
  y = a_laguerres(row, :);
  axis([0, 40, -1, 1])
  plot(x, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end
xlabel('x'); ylabel('Associated Laguerre polynomials');
legend('0th order','1st order','2nd order','3rd order','4th order','5th order')

% Verifying orthonormality
for i = 1:n+1
  for j = i:n+1
    prod = laguerre_inner_product(a_laguerres(i,:), a_laguerres(j,:), x);
    display([i-1 j-1 prod]);
  end
end

  
