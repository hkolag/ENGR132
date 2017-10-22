function [] = PS08_thermocouple_hkolagan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Determines whether batches of products meet the desire
%   specification.
%
% Function Call
% 	PS08_thermocouple_hkolagan()
%
% Input Arguments
%   NONE
%
% Output Arguments
%   NONE
%
% Assigment Information
%   Assignment:  	    PS 08, Problem 3
%   Author:             hkolagan, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Load the data files
data = load('thermocouple_boundaries.txt');
time = data(:, 1);
one = data(:,2);
two = data(:,3);
three = data(:,4);
four = data(:,5);
five =  data(:,6);
constants = load('time_constants.txt');



%% ____________________
%% CALCULATIONS
dif = 0.632 * 5 + 50;

% c. Use MATLAB to determine and report the number of thermocouples in each category (accepted,
% marginally accepted, rejected) to the MATLAB Command Window.
rej = sum((constants < 1.787) | (constants > 4.196));
marg = sum((constants > 1.787) & (constants < 2.4) | (constants > 3.6) & (constants <4.196));
nom = sum((constants > 2.4) & (constants < 3.6));

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
% Generate a plot like Figure 4, with the 5 time histories (appropriately colored)
plot(time, one,'r')
hold on;
plot(time, two, 'y')
hold on;
plot(time, three, 'g')
hold on;
plot(time, four, 'y')
hold on;
plot(time, five, 'r')
hold on;
plot(constants, dif, 'bo')
xlabel('Time in Seconds')
ylabel('Temperature in Celcius')
title('Thermocouple Temperatures over Time')
legend('Reject Boundary', 'Marginal Accept Boundary', 'Nominal Performance')

fprintf('Number of thermocouples that are accepted: %d.\n', nom)
fprintf('Number of thermocouples that are marginally accepted: %d.\n', marg)
fprintf('Number of thermocouples that are rejected: %d.\n', rej)
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
