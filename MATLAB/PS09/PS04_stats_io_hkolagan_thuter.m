function [meanvec1, meanvec2, stdvec1, stdvec2] = PS4_stats_script_hkolagan_asartor(vec1, vec2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Displays mean and standard deviation for 2 inputed vectors
%
% Functvion Call
%   PS04_stats_io_hkolagan_asartor(vec1, vec2)

% Input Arguments
%   1. vec1
%   2. vec2

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
stdvec1 = std(vec1);

meanvec2 = mean(vec2);
stdvec2 = std(vec2);

%% ____________________
%% FORMATTED TEXT DISPLAY
% 8. Copy relevant sections from your script into the UDF. Fix them as necessary 
% to make them work within the UDF.
%fprintf('The mean of vector 1 is %.2f\n', meanvec1)
%fprintf('The standard deviation of vector 1 is %.2f\n', stdvec1)
%fprintf('The mean of vector 2 is %.2f\n', meanvec2)
%fprintf('The standard deviation of vector 2 is %.2f\n', stdvec2)

%% ____________________
%% COMMAND WINDOW OUTPUT
% Paste as comments the two function calls and the displayed text to the 
% COMMAND WINDOW OUTPUTS section of the code.

% PS04_stats_io_hkolagan_asartor(vec1, vec2)
% The mean of vector 1 is 8.82
% The standard deviation of vector 1 is 0.04
% The mean of vector 2 is 13.90
% The standard deviation of vector 2 is 0.40

%% ANALYSIS

%% Q1
% Between the script and the stat_nino UDF, there are virtually no
% differences. They both produce the same results in the command window.

%% Q2
% When the stats_io function is called on, the results are different than
% that of stats_nino because it only displays the mean and standard
% deviation of vector 1's integers.

%% Q2
% The program description and function call is displayed in the command
% window. This is very helpful because if the UDF is very long, this line
% would help one realize what the purpose of the function they are working
% on is and also help one see how to call on it for it to run as well.

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
