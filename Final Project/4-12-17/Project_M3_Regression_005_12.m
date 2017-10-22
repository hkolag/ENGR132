function [] = Project_M3_Regression_005_12(tau1,tau2,tau3,tau4,tau5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%  
%
% Function Call
% 	
%
% Input Arguments
%   
%
% Output Arguments
%   
%
% Assigment Information
%   Assignment:         PS ##, Problem #
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            ###-##
%  	Paired Programmer:  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% VARIABLE ASSIGNMENTS
price(1:20) = 15.27;
price(21:40) = 10.61;
price(41:60) = 2.69;
price(61:80) = 1.23;
price(81:100) = 0.11;

tau(1:20) = tau1;
tau(21:40) = tau2;
tau(41:60) = tau3;
tau(61:80) = tau4;
tau(81:100) = tau5;

%% ____________________
%% CALCULATIONS
%figure(1)
%plot(tau, price, 'r.')

polyData = polyfit(tau, log10(price), 1);
fittedData = polyval(polyData, tau);

figure(2)
semilogy(tau, price, 'r.')
hold on;
plot(tau,fittedData,'k')




%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%