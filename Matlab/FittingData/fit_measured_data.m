%FIT_MEASURED_DATA generates a
% Laguerre fit to a set of measured
% channel data.  The fit mathematically
% describes the probability density
% of the attenuation (squared) of a 
% measured wireless channel.
% 
% jpc 23/10/13
function [ a ] = fit_measured_data( maxorder, alpha )
    
% Load the measured data.
% Two vectors will appear
% in the workspace:
%   xi is a vector of data point
%     locations;
%   fo is a vector of data points.
load('measured_data.mat')

% Plot the data.
% This will help you to
% visualisation what the fit
% should look like.
ystr = sprintf('Density data points');
figure
set(gca,'FontSize',18);
plot(xi,fo,'kx','LineWidth',1.2)
xlabel('x');
ylabel(ystr);
title('Histogram points for measured data');
grid on

%%% Your code here %%%

end