function [] = Project_M4_Regression_005_12(tau1,tau2,tau3,tau4,tau5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%  Plots our tau values for each model number vs the price of said model
%  number. It first regresses it using the log of the y axis and then plots
%  a trendline as well. Additionally this UDF also calculates the SSE, SST
%  and r-squared value for the trendline created on the plot.
%
% Function Call
% 	Project_M4_Regression_005_12(tau1,tau2,tau3,tau4,tau5)
%
% Input Arguments
%   1. tau1 - the first 20 tau values (model number 1)
%   2. tau2 - the second 20 tau values (model number 2)
%   3. tau3 - the third 20 tau values (model number 3)
%   4. tau4 - the fourth 20 tau values (model number 4)
%   5. tau5 - the last 20 tau values (model number 5)
%
% Output Arguments
%   N/A
%
% Assignment Information
%	Assignment:         Final Project
%	Author:             Team 5, Section 12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% VARIABLE ASSIGNMENTS
price(1:20) = 15.27; %Separates the prices for each of the model numbers. This designates that model number 1 will always have the same price and so on.
price(21:40) = 10.61;
price(41:60) = 2.69;
price(61:80) = 1.23;
price(81:100) = 0.11;

price_fit(1) = 15.27; %Separates the prices for each of the model numbers. However, this is done in a vector with only five dimensions. 
                      %We do this because a best-fit line that is created using only five points will be easier and quicker to produce 
                      %when compared to a best-fit line that is made using
                      %100 data points. Additionally because a large number
                      %of these points are horizontal to each other, if we
                      %make a best fit line that looks at all 100 points,
                      %the line will end up being expressed incorrectly.
price_fit(2) = 10.61;
price_fit(3) = 2.69;
price_fit(4) = 1.23;
price_fit(5) = 0.11;

tau(1:20) = tau1; %Separates tau into their respective model numbers.
tau(21:40) = tau2;
tau(41:60) = tau3;
tau(61:80) = tau4;
tau(81:100) = tau5;

%% ____________________
%% CALCULATIONS

 average_tau(1) = mean(tau1); %The mean of each model number's tau values are determined and used to find the best fit line.
 average_tau(2) = mean(tau2);
 average_tau(3) = mean(tau3);
 average_tau(4) = mean(tau4);
 average_tau(5) = mean(tau5);
 
 polyData = polyfit(average_tau, log10(price_fit), 1); %Obtains the coefficients needed for the best fit line we will end up creating.
 b_value = 10.^(polyData(2)); %Finds the y-intercept value for the equation we will determine.
 calculated_price = b_value.*10.^(polyData(1).*average_tau); %Determined best-fit equation. 
 Equation_best_fit = sprintf('y = %.3f * 10^%.3f*x', b_value, polyData(1)); %Used to display the general equation of the trendline using the calculated_price equation.
 
figure(1)
plot(tau, price, 'r.') %Plots tau vs. price on a semilog-y scale. This scale was used because it was the scale that represented the data in the most linear fashion.
hold on;
plot(average_tau,calculated_price, 'b-') %The trendline is plotted over the tau vs. price plots that was graphed before hand.
text(1.2,12,Equation_best_fit)% Puts the general equation for the trendline on the plot.
title('Price of Thermocouple Compared to Time Constant')
xlabel('Time Constant (sec)')
ylabel('Thermocouple Price ($)')
grid on
legend('Actual Data','Trendline')


SSE = mean((price_fit - calculated_price).^2) %Calculates the SSE. 
SST = mean((price_fit - mean(calculated_price)).^2) %Calculates the SST.
rval = 1 - (SSE/SST) %Calculates the r-squared value by utilizing the calcul



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%