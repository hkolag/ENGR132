function [] = PS06_enplanements_exec_hkolagan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	Calls the two sub-UDFs to perform the regression analysis
%   Plots the data with its least squares regression for each season in the data set.
%
% Function Call
% 	PS06_enplanements_exec_hkolagan()
%
% Input Arguments
%	NONE
%
% Output Arguments
%	NONE
%
% Assigment Information
%   Assignment:         PS 06, Problem 3
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
allData = csvread('Data_airpassengers_seasons.csv',8,0);
dataYear = allData(:,1);
dataWinter = allData(:, 2);
dataSpring = allData(:, 3);
dataSummer = allData(:, 4);
dataFall = allData(:, 5);

winter = 'Winter';
spring = 'Spring';
summer = 'Summer';
fall = 'Autumn';

%% ____________________
%% CALCULATIONS
% Calls the two sub-UDFs to perform the regression analysis

[slopeW, y_intW] = PS06_enplanements_coefs_hkolagan(winter, dataYear, dataWinter);
[slopeSp, y_intSp] = PS06_enplanements_coefs_hkolagan(spring, dataYear, dataSpring);
[slopeSu, y_intSu] = PS06_enplanements_coefs_hkolagan(summer, dataYear, dataSummer);
[slopeF, y_intF] = PS06_enplanements_coefs_hkolagan(fall, dataYear, dataFall);

[predValW, rsqW] = PS06_enplanements_predict_hkolagan(slopeW, y_intW, dataYear, dataWinter, winter);
[predValSp, rsqSp] = PS06_enplanements_predict_hkolagan(slopeSp, y_intSp, dataYear, dataSpring, spring);
[predValSu, rsqSu] = PS06_enplanements_predict_hkolagan(slopeSu, y_intSu, dataYear, dataSummer, summer);
[predValF, rsqF] = PS06_enplanements_predict_hkolagan(slopeF, y_intF, dataYear, dataFall, fall);

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
% Plots the data with its least squares regression for each season in the data set.

subplot(2,2,1)
plot(dataYear, dataWinter, 'k.')
hold on;
plot(dataYear, predValW,'k')
xlabel('Year')
ylabel('Passenger Count in Millions')
title('Airline Passengers during Winter')
grid on;

subplot(2,2,2)
plot(dataYear, dataSpring, 'r.')
hold on;
plot(dataYear, predValSp, 'r')
xlabel('Year')
ylabel('Passenger Count in Millions')
title('Airline Passengers during Spring')
grid on;

subplot(2,2,3)
plot(dataYear, dataSummer, 'm.')
hold on;
plot(dataYear, predValSu, 'm')
xlabel('Year')
ylabel('Passenger Count in Millions')
title('Airline Passengers during Summer')
grid on;

subplot(2,2,4)
plot(dataYear, dataFall, 'b.')
hold on;
plot(dataYear, predValF, 'b')
xlabel('Year')
ylabel('Passenger Count in Millions')
title('Airline Passengers during Autumn')
grid on;

%% ____________________
%% ANALYSIS

%% -- Q1
% The linear model for Autumn best explains the variation in the data
% because it has a higher R squared value than the other linear models

%% -- Q2
% Spring has the greatest growth rate in number of passengers because it
% has agreater slope in comparison to the other seasons. Autumn has the
% lowest growth rate because it has the smallest slope.

%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%