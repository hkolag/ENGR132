function [] = PS04_stats_script_hkolagan_asartor()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Displays mean, range, and standard deviation for 2 vectors in a script
%   file
%
% Function Call
%   PS04_stats_script_hkolagan_asartor

% Input Arguments
%   none

% Output Arguments
%   none

% Assignment Information
%   Assignment:       	PS 04, Problem 2
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12     
%  	Paired Programmer:  Andrew Sartorio, asartor@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION


%% ____________________
%% STATISTICS CALCULATIONS
meanvec1 = mean(vec1);
rangevec1 = range(vec1);
stdvec1 = std(vec1);

meanvec2 = mean(vec2);
rangevec2 = range(vec2);
stdvec2 = std(vec2);

%% ____________________
%% FORMATTED TEXT DISPLAY
% 8. Copy relevant sections from your script into the UDF. Fix them as necessary 
% to make them work within the UDF.
fprintf('The mean of vector 1 is %.2f\n', vec1)
fprintf('The range of vector 1 is %.2f\n', vec1)
fprintf('The standard deviation of vector 1 is %.2f\n', vec1)
fprintf('The mean of vector 2 is %.2f\n', meanvec2)
fprintf('The range of vecotr 2 is %.2f\n', rangevec2)
fprintf('The standard deviation of vector 2 is %.2f\n', stdvec2)

%% ____________________
%% COMMAND WINDOW OUTPUT
% 10. Paste as comments the function call and the displayed text to the 
% COMMAND WINDOW OUTPUTS section of the code.

% PS04_stats_script_hkolagan_asartor
% The mean of vector 1 is 8.82
% The range of vector 1 is 0.12
% The standard deviation of vector 1 is 0.04
% The mean of vector 2 is 13.90
% The range of vecotr 2 is 1.08
% The standard deviation of vector 2 is 0.40


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
