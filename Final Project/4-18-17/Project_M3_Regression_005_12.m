function [] = Project_M3_Regression_005_12(tau1,tau2,tau3,tau4,tau5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%  Plots our tau values for each model number vs the price of said model
%  number. It first regresses it using the log of the y axis and then plots
%  a trendline as well. Additionally this UDF also calculates the SSE, SST
%  and r-squared value for the trendline created on the plot.
%
% Function Call
% 	Project_M3_Regression_005_12(tau1,tau2,tau3,tau4,tau5)
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
% Assigment Information
%   Assignment:         Milestone 3
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Tyler Huter, thuter@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% VARIABLE ASSIGNMENTS
price(1:20) = 15.27; %Separates the prices for each of the model numbers. This designates that model number 1 will always have the same price and so on.
price(21:40) = 10.61;
price(41:60) = 2.69;
price(61:80) = 1.23;
price(81:100) = 0.11;
price_fit(1) = 15.27; %Separates the prices for each of the model numbers. This designates that model number 1 will always have the same price and so on.
price_fit(2) = 10.61;
price_fit(3) = 2.69;
price_fit(4) = 1.23;
price_fit(5) = 0.11;

tau(1:20) = tau1; %Separates tau into their respective model numbers
tau(21:40) = tau2;
tau(41:60) = tau3;
tau(61:80) = tau4;
tau(81:100) = tau5;
merged_tau = [tau1,tau2,tau3,tau4,tau5];
%total_price = price(1:100)% Merges all the model numbers together into one vector so we only need to plot once.
%% ____________________
%% CALCULATIONS

 average_tau(1) = mean(tau1)
 average_tau(2) = mean(tau2)
 average_tau(3) = mean(tau3)
 average_tau(4) = mean(tau4)
 average_tau(5) = mean(tau5)
 polyData = polyfit(average_tau, log10(price_fit), 1); %Obtains the coefficients needed for the best fit line we will end up creating.
 %fittedData = polyval(polyData, merged_tau); %Creates a best fit line from the coefficients deetermined in the polyfit command.
 b_value = 10.^(polyData(2))
 calculated_price = b_value.*10.^(polyData(1).*average_tau)
 
figure(1)
plot(tau, price, 'r.') %Plots tau vs. price on a semilog-y scale. This scale was used because it was the scale that represented the data in the most linear fashion.
hold on;
plot(average_tau,calculated_price, 'b-') %The trendline is plotted over the tau vs. price plots that was graphed before hand.
title('Price of Thermocouple Compared to Time Constant')
xlabel('Time Constant (sec)')
ylabel('Thermocouple Price ($)')
grid on
legend('Actual Data','Trendline')
disp('y=-9x+16')

SSE = mean((price - fittedData).^2) 
SST = mean((price - mean(fittedData)).^2) %Calculates the SST for each season.
rval = 1 - (SSE/SST)



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%