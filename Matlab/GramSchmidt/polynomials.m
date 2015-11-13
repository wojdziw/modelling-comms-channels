%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function polynomials.m
%
% Computes the vector of the e-coefficients of the Gram-Schmidt polynomials
% Inputs:
% highest_order    Highest order of the calculated polynomials
% Outputs:
% A vector of vectors containing the coefficients.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = polynomials(highest_order, xrange)
  ones = monomials(highest_order);
  coefficients = zeros(highest_order);
  g_g_product = zeros([1 highest_order]);

  for order = 1:highest_order
    coefficients(order, highest_order-order+1) = 1;
    for power = 1:order-1
      v_g_product = inner_product(ones(order,:),coefficients(order-power,:),xrange);
      e_coeff = v_g_product/g_g_product(order-power);
      fprintf('e%0.0f%0.0f equals %0.3f \n',order-1, power-1, e_coeff)
      coefficients(order, :) = coefficients(order, :) + (-1)*e_coeff*coefficients(order-power, :);
    end
    g_g_product(order) = inner_product(coefficients(order,:), coefficients(order,:), xrange);
  end
  
  % Verifying orthogonality
  for i = 1:highest_order
    for j = i:highest_order
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
  
  
  % Computing the normalizing constant and normalizing the polynomial
  for order = 1:highest_order
    normalizing_constant = sqrt(g_g_product(order));
    coefficients(order, :) = coefficients(order,:)/normalizing_constant;
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
      
