function [fcost] = PS06_fuelcost_model_hkolagan_thuter(fprice)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	A user-defined function that determines the linear model using the data provided in Problem 1 and then
%   use the resulting model to make predictions
%
% Function Call
% 	[fcost] = PS06_fuelcost_model_hkolagan_thuter(fprice)
%
% Input Arguments
%	1. Fuel Price
%
% Output Arguments
%	1. Fuel Cost
%
% Assigment Information
%   Assignment:         PS 06, Problem 2
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005-12
%   Paired Programmer:  Tyler Huter, thuter@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION
fprice = 3.00;
data = csvread('Data_fuelcost.csv',1,1);
cost = data(:,4);
price = data(:,2);

%% ____________________
%% CALCULATIONS
% Perform linear regression on the fuel data using the polyfit command. The fuel data
% should be loaded in the function as to opposed to passed as an input argument.
P1 = polyfit(price,cost,1)

% Compute the predicted values of the linear model using the polyval command.
y_model = polyval(P1,price);

% Calculate the SSE, SST, and r2 values of the model.
SSE = mean((cost - y_model).^2)
SST = mean((cost - mean(y_model)).^2)
Rsqrd = 1 - SSE / SST

fcost = P1(1)*(fprice)+P1(2)

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
% Generate a scatter plot and overlay your linear model on the data.
plot(cost, price,'ko')
xlabel('Fuel Cost in Billions of Dollars')
ylabel('Fuel Price in Dollars Per Gallon')
title('Fuel Cost vs. Fuel Price')
hold on;
plot(y_model,price)
grid on;

%% ____________________
%% ANALYSIS

%% Q1
% Compared to the Excel model, the MATLAB model is a lot more accurate
% because it yielded a higher r^2 value. The functions that MATLAB uses is
% far more precise because errors can be made while doing calculations by
% hand.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%