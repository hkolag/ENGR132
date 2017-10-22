function [Sqrt_2Value, Abs_difference] = PS10_sqrt2_asartor_hkolagan(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   ... Accepts the number of terms to sum the in the taylor series to
%   compute square root 2, returns the square root two approximation as
%   well as the absolute differene
%
% Function Call
% 	...PS10_sqrt2_asartor_hkolagan(n)
%
% Input Arguments
%   1. ..."n"- number of terms to summate
%
% Output Arguments
%   1. ...[Sqrt_2Value, Abs_difference]
%
% Assigment Information
%   Assignment:  	    PS10 Problem 2
%   Author:             Andrew Sartorio, asartor@purdue.edu
%   Team ID:            125-12
%  	Paired Programmer:  Harith Kolaganti, hkolagan@purdue.edu
%  	Contributor:        Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION
%Initializes acceptable "n" inputs, cannot be a negative number
y=0;
if n < 0
    disp('Error: Invalid "n" value')
    y=1;
end

%Initializes the estimate at 0
Sqrt_2value = 0;
    

%% ____________________
%% CALCULATIONS
%For acceptable inputs, the for loop will run, and calculate an
%approxomation of root 2 according to a taylor series, summating "n" number
%of terms
if y == 0 
    for index = 0:1:(n-1)
        numerator = factorial(2*index+1);
        denomonator = (2^(3*index+1))*(factorial(index))^2;
        Next_term = numerator/denomonator;
        Sqrt_2value = Sqrt_2value + Next_term;
    end
    
    Abs_difference = abs(sqrt(2) - Sqrt_2value);




%% ____________________
%% FORMATTED TEXT DISPLAYS

fprintf('Our Square Root 2 value is %.10f\n and our Absolute Difference is %.10f\n', Sqrt_2value, Abs_difference) 

end


%% ____________________
%% COMMAND WINDOW OUTPUTS
%Input positive integer n=6
%PS10_sqrt2_asartor_hkolagan(6)
%Our Square Root 2 value is 1.3652954102
%and our Absolute Difference is 0.0489181522

%Input negative integer n=-1
%PS10_sqrt2_asartor_hkolagan(-1)
%Error: Invalid "n" value

%PS10_sqrt2_asartor_hkolagan(10)
%Our Square Root 2 value is 1.4104420692
%and our Absolute Difference is 0.0037714932

%PS10_sqrt2_asartor_hkolagan(25)
%Our Square Root 2 value is 1.4142133885
%and our Absolute Difference is 0.0000001739

%PS10_sqrt2_asartor_hkolagan(50)
%Our Square Root 2 value is 1.4142135624
%and our Absolute Difference is 0.0000000000



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.