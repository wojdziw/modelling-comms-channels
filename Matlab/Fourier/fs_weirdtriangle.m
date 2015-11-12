% Compute Fourier coeffs and series upto nterms for a triangle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fs_triangle.m DWM 6/9/10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function fs_weirdtriangle(T,nint,nterms)
  w = 2*pi/T;                   % Derive omega
                                % Integral from -T/2 to +T/2
  x = (-T/2:T/nint:T/2);        % Make vector of x values
  f = fs_weirdperiodictriangle(T,x,0.1); % Make vector of f(x) values
% Compute coefficients 
  A0 = fs_Acoeff(T,0,f,x);      % A0 done separately
  for m=1:1:nterms
    A(m) = fs_Acoeff(T,m,f,x);  % The rest in a loop
    B(m) = fs_Bcoeff(T,m,f,x);  %
  end
% For fun, build the series approximation to nterms
  fseries = (A0/2)*ones(size(x));
  for m=1:1:nterms
    fseries = fseries + A(m)*cos(m*w*x) + B(m)*sin(m*w*x);
  end
% Plot original triangular function
  hold off;
  set(gca, 'FontSize', 18);
  plot(x, f, '-', 'LineWidth',3, 'Color', [0.8 0 0]);
  xlabel('x'); ylabel('Periodic Triangle Function'); hold on;
% Save diagram as colour postscript
  print('-depsc', 'fs_triangle.eps');
% Plot FS approximation to nterms
  hold off;
  set(gca, 'FontSize', 18);
  plot(x, fseries, '-', 'LineWidth',3, 'Color', [0.0 0.0 0.8]);
  xlabel('x'); 
  ylabel(sprintf('Fourier series: %d terms',nterms));
  hold on;
% Save diagram as colour postscript
% Filename will include the number of terms. 
  print('-depsc', sprintf('fs_triangle%d.eps',nterms));

