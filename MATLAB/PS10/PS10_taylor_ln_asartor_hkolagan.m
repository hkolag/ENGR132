function [Counter, lnx_approx, Abs_Difference] = PS10_taylor_ln_asartor_hkolagan(x, tolerance)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   ... Computes the approxomation of a natural log of a given input using
%   a taylor series
%
% Function Call
% 	...PS10_taylor_ln_asartor_hkolagan(x, tolerance)
%
% Input Arguments
%   1. ...(x, tolerance)
%
% Output Arguments
%   1. ...[Counter, lnx_approx, Abs_Differene]
%
% Assigment Information
%   Assignment:  	    PS10, Problem 1
%   Author:             Andrew Sartorio, asartor@purdue.edu
%   Team ID:            125-12
%  	Paired Programmer:  Harith Kolaganti, hkolagan@purdue.edu
%  	Contributor:        Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION

%Sets accpectable bounds for x value to compute the natural log of and
%tolerance
if x>2 | x<=0
    disp('Error: Invalid X value')
    y=1;
end
if tolerance>1 | tolerance<0
    disp('Error: Invalid tolerance')
    y=1;
end

%Initializes variables within the loop
Term_1= (((-1)^2)*(x-1)^1)/(1);
lnx_approx = Term_1;
Abs_nth_term = abs(Term_1);
Counter=1;


%% ____________________
%% CALCULATIONS
%Does not let the while loop run if there is an error, then computes the
%approxomate natural log of "x" accroding to a taylor series
if y ~= 1;
    
while Abs_nth_term > tolerance
   
    Term_n = (((-1)^(Counter+1)*(x-1)^Counter)/Counter)
    lnx_approx = lnx_approx + Term_n
    Abs_nth_term = abs(Term_n);
    Counter = Counter + 1;
end

Abs_Difference = abs(lnx_approx - log(x));



%% ____________________
%% FORMATTED TEXT DISPLAYS

fprintf('The number of terms used is %d\n',Counter)
fprintf('The approximate natural log is %.2f\n', lnx_approx)
fprintf('The absolute difference between the real and approximated values is %.2f', Abs_Difference)
end
%% ____________________
%% COMMAND WINDOW OUTPUTS
%Inputs:(.5, .05)
%The number of terms used is 4
%The approximate natural log is -1.17
%The absolute difference between the real and approximated values is 0.47

%Inputs:(3,.5)
%Error: Invalid X value

%Inputs:(2,3)
%Error: Invalid tolerance


%% ____________________
%%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.


