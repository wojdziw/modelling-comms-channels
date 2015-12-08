%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gs_laguerre_comparison.m
% 
% Compares the Laguerre polynomials computed recursively to the
% corresponding Gram Schmidt polynomials with a chosen base.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 5;                            % Define the highest order of the orthogonal polynomial
x = 0:0.001:70;                        % X range for investigation
alpha = 0;
alternating_ones = false;

% Computing the Gram Schmidt and Laguerre values for the given x
gm_coefficients = gs_polynomials(n, x, alternating_ones);
lr_coefficients = recursive_laguerre(n,alpha);

display(gm_coefficients);
display(lr_coefficients);

% Plotting the compared Gram Schmidt and Laguerre polynomials
figure
subplot(2,1,1);
for row = 1:n+1
  y = polyval(gm_coefficients(row,:),x);
  axis([0,20,-80,80])
  plot(x, y, '-', 'LineWidth',1, 'Color', 'r'); hold on; 
end
xlabel('x'); ylabel('Gram Schmidt polynomials');
subplot(2,1,2);
for row = 1:n+1
  y = polyval(lr_coefficients(row,:),x);
  axis([0,20,-80,80])
  plot(x, y, '-', 'LineWidth',1, 'Color', 'b'); hold on; 
end
xlabel('x'); ylabel('Laguerre polynomials');
print('-depsc', '../Report/gs_laguerre_comparison.eps');