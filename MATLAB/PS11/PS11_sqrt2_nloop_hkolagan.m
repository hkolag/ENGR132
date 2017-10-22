function [Sqrt_2Value, Abs_difference] = PS11_sqrt2_nloop_hkolagan(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Accepts the number of terms to sum the in the taylor series to
%   compute square root 2, returns the square root two approximation as
%   well as the absolute differene
%
% Function Call
% 	PS11_sqrt2_asartor_hkolagan(n)
%
% Input Arguments
%   1. "n"- number of terms to summate
%
% Output Arguments
%   1. [Sqrt_2Value, Abs_difference]
%
% Assigment Information
%   Assignment:  	    PS10 Problem 2
%   Author:             Andrew Sartorio, asartor@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Harith Kolaganti, hkolagan@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION
%Initializes acceptable "n" inputs, cannot be a negative number
if n < 0
    disp('Error: Invalid "n" value')

%% ____________________
%% CALCULATIONS
%For acceptable inputs, the for loop will run, and calculate an
%approxomation of root 2 according to a taylor series, summating "n" number
%of terms
else
    k = 0:1:(n-1);
    
    Sqrt_2value = sum((factorial(2*k + 1)./(2.^(3*k+1).*factorial(k).^2)));
    
    Abs_difference = abs(sqrt(2) - Sqrt_2value);
end

%% ____________________
%% FORMATTED TEXT DISPLAYS
fprintf('Our Square Root 2 value is %.10f\nAbsolute Difference is %.10f\n', Sqrt_2value, Abs_difference) 

%% ____________________
%% COMMAND WINDOW OUTPUTS
% PS11_sqrt2_nloop_hkolagan(10)
% Our Square Root 2 value is 1.4104420692
% Absolute Difference is 0.0037714932

% PS11_sqrt2_nloop_hkolagan(15)
% Our Square Root 2 value is 1.4140727379
% Absolute Difference is 0.0001408245

% PS11_sqrt2_nloop_hkolagan(37)
% Our Square Root 2 value is 1.4142135623
% Absolute Difference is 0.0000000001

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.