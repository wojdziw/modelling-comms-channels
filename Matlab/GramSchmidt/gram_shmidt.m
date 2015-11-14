%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GramSchmidt.m
% Script to calculate and plot the coefficient of the orthogonal set of
% functions using the Gram Schmidt method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
highest_order = 5;                            % Define the highest order of the orthogonal polynomial
xrange = (0:0.001:70);                        % X range for investigation

coefficients = polynomials(highest_order, xrange);  % Calculate the coefficients of the polynomials

display(coefficients);

hold off;
set(gca, 'FontSize', 18);
for i = 1:highest_order+1
  y = polyval(coefficients(i,:),xrange);
  axis([0,20,-80,80])
  plot(xrange, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end
xlabel('x'); ylabel('Normalised polynomials values');
print('-depsc', 'gm.eps'); % Save diagram as colour postscript

% Verifying orthogonality
for i = 1:highest_order+1
  for j = i:highest_order+1
    if (i == j)
      if (inner_product(coefficients(i,:), coefficients(j,:), xrange) > 10^(-3)) 
        fprintf('Polynomial of order %0.0f is not orthogonal to itself :) \n',i)
      else 
        fprintf('Polynomial of order %0.0f is orthogonal to itself :( \n',i)
      end
    end
    if (i ~= j)
      if (inner_product(coefficients(i,:), coefficients(j,:), xrange) < 10^(-3)) 
        fprintf('Polynomials of orders %0.0f and %0.0f are orthogonal :) \n',i,j)
      else 
        fprintf('Polynomials of orders %0.0f and %0.0f are not orthogonal :( \n',i,j)
      end
    end
  end
end

% Verifying orthonormality
for i = 1:highest_order
  for j = i:highest_order
    if (i == j)
      product = inner_product(coefficients(i,:), coefficients(j,:), xrange);
      if (product > 0.999 && product < 1.001) 
        fprintf('Polynomial of order %0.0f is not orthonormal to itself :) \n',i)
      else 
        fprintf('Polynomial of order %0.0f is orthonormal to itself :( \n',i)
      end
    end
    if (i ~= j)
      if (inner_product(coefficients(i,:), coefficients(j,:), xrange) < 10^(-3)) 
        fprintf('Polynomials of orders %0.0f and %0.0f are orthonormal :) \n',i,j)
      else 
        fprintf('Polynomials of orders %0.0f and %0.0f are not orthonormal :( \n',i,j)
      end
    end
  end
end

% for i = 1:highest_order
%   for j = i:highest_order
%     disp([i, j]);
%     display(inner_product(coefficients(i,:), coefficients(j,:), xrange));
%   end
% end



