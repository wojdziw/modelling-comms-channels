%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GramSchmidt.m
% Script to calculate and plot the coefficient of the orthogonal set of
% functions using the Gram Schmidt method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

n = 5;
x = (0:0.001:70);

coefficients = gs_polynomials(n, x);

display(coefficients);

hold off;
set(gca, 'FontSize', 18);
for order = 0:n
  row = order+1;
  y = polyval(coefficients(row,:),x);
  axis([0,20,-80,80])
  plot(x, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end
xlabel('x'); ylabel('Gram Schmidt polynomials');

orthogonality_matrix = zeros(n+1);

% Verifying orthonormality
for i = 1:n+1
  for j = 1:n+1
    product = gs_inner_product(coefficients(i,:), coefficients(j,:), x);
    orthogonality_matrix(i,j) = product;
    orthogonality_matrix(j,i) = product;
  end
end

display(orthogonality_matrix);