%EXP_DATA generates exponentially distributed data,
% normalises it, and plots a histogram, which
% is an approximation to the density function
% associated with the underlying distribution.
% 
% The histogram data and the bin locations are
% returned as vectors.
% 
% input
% 
%   sigma2      scales the Gaussian data (scalar)
%   mu          offsets the Gaussian data (cplx scalar)
%   nsamp       number of data samples (scalar)
%   nbins       number of bins in the histogram (scalar)
% 
% output
% 
%   fo          histogram points (vector)
%   x           histogram bin locations (vector)
% 
% jpc 21/10/13
function [ fo, x ] = exp_data( sigma2, mu, nsamp, nbins )

% Synthesise complex normal data
%   mean = 0
%   variance per dimension = sigma2/2
W = sqrt(sigma2/2)*(randn(1,nsamp) + 1i*randn(1,nsamp))...
    + mu;

% Calculate the power
%   This should be exponentially distributed.
%   The mean should be approx. sigma2
X = abs(W).^2;

% Generate a histogram with nbins
%   The elements of fo are the number
%    of samples of X that fall in each bin.
%   The vector x corresponds to the
%    bin locations.
[fo,x] = hist(X,nbins);     % histogram
fo = fo/trapz(x,fo);        % normalise; fo is a density func

% Plot the data and save
ystr = sprintf('Exponentially distributed data (mean = %g)',sigma2);
figure
set(gca,'FontSize',18);
plot(x,fo,'k.','LineWidth',1.2)
xlabel('x');
ylabel(ystr);
grid on
print('-depsc',sprintf('exp_data_%g.eps',sigma2));

end

