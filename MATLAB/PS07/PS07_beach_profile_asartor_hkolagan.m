function [Depth_value] = PS07_beach_profile_template(Distance_value)
%re%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Models the beach profile of the given beach.
%
% Function Call
% 	[Depth_value] = PS07_beach_profile_template(Distance_value)
%
% Input Arguments
%   1. Distance_value  % Distance away from shore
%
% Output Arguments
%   1. Depth_Value     % Depth of water using the model at a particular
%                        distance
%
% Assigment Information
%   Assignment:  	    PS 07, Problem 2
%   Author:             Andrew Sartorio, asartor@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Harith Kolaganti, hkolagan@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Import the beach measurement data.
Beach_data = csvread('Data_beach_measurements.csv', 1, 0);
Distance = Beach_data(:,1);
Depth = Beach_data(:,2);

%% ____________________
%% FUNCTION DISCOVERY SUBPLOTS
% Create one figure with 2x2 subplots (i.e., 2 rows and 2 columns) that contains the data plotted on
% linear, semilogx, semilogy, and loglog scales
figure
subplot(2,2,1)
plot(Distance, Depth, 'ko')
xlabel('Distance from Shore (meters)')
ylabel('Water Depth (meters)')
title('Raw Data')
grid on

subplot(2,2,2)
semilogx(Distance, Depth, 'ko')
xlabel('Log of Distance from Shore')
ylabel('Water Depth (meters)')
title('Semilogx')
grid on

subplot(2,2,3)
semilogy(Distance, Depth, 'ko')
xlabel('Distance from Shore (meters)')
ylabel('Log of Water Depth')
title('Semilogy')
grid on

subplot(2,2,4)
loglog(Distance, Depth, 'ko')
xlabel('Log of Distance from Shore')
ylabel('Log of Water Depth')
title('Log Log')
grid on




%% ____________________
%% LINEARIZED DATA
%Fits the data with a best fit line, assigns coefficients m and b to vector
%P(1)
P1 = polyfit(log10(Distance), log10(Depth), 1);
fitted_data = polyval(P1, log10(Distance));
%Linearized equation
log_of_Depth = P1(1)*(log10(Distance)) + P1(2);
fprintf('The linearlized equation is the log of the Depth value is%.3f(log of Distance) + %.3f.\n', P1(1), P1(2))
%Plots the log log graph of the data with the best fit line over it
figure
plot(log10(Distance), log10(Depth), 'ko');
hold on
plot(log10(Distance), fitted_data, 'r-');
xlabel('Log of Distance from Shore')
ylabel('Log of Depth')
title('Log of Distance vs Log of Depth Data')
grid on

%% ____________________
%% BEACH PROFILE MODEL
fprintf('The generalized equation is Depth is equal to 10^%.3f*(Distance Value)^%.3f', P1(2), P1(1))
%plots the raw data with the fitted best fit line of the data
profile_y = (10^(P1(2)))*((Distance).^P1(1));
figure
plot(Distance, Depth, 'ko-');
hold on
plot(Distance, profile_y, 'r--');
xlabel('Distance from Shore (meters)');
ylabel('Depth (meters)');
title('Distance from Shore vs Depth')
ax3 = gca;
set(ax3,'Ydir','reverse');
grid on

%% ____________________
%% BEACH PREDICTION
% Write code that will use your model and the UDF input to calculate
% the UDF output
Depth_value = (10^(P1(2)))*((Distance_value).^P1(1))

%% ____________________
%% ANALYSIS

%% -- Q1
% The log-log graph appears to best represent the relationship beween the
% data. In the figure window, the log-log graph, with axis scaled by 10^n,
% produces a linear model of the data.

%% -- Q2
% Mr. McGuire, The depths of the pylons, based on a linearized model of the water depth vs distance from
% the shore, are 7.5486 12.3039 16.3741 20.0549 23.4707 and 26.6893 respectively.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
