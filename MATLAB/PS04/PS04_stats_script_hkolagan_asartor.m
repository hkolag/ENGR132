%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%   ...
%
% Assignment Information
%   Assignment:       	PS 04, Problem 2
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005-12     
%  	Paired Programmer:  Andrew Sartorio, asartor@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% In the INITIALIZATION section of your code, assign each vector.
vec1 = [8.800, 8.871, 8.813, 8.861, 8.842, 8.815, 8.755];
vec2 = [14.081, 14.175, 13.896, 13.633, 14.560, 13.478, 13.507];

%% ____________________
%% STATISTICS CALCULATIONS
% In the STATISTICS CALCULATIONS section, compute the range, mean, and 
% standard deviation for each vector. Ensure that all computation lines are suppressed.
meanvec1 = mean(vec1);
rangevec1 = range(vec1);
stdvec1 = std(vec1);

meanvec2 = mean(vec2);
rangevec2 = range(vec2);
stdvec2 = std(vec2);

%% ____________________
%% FORMATTED TEXT DISPLAY
% In the FORMATTED TEXT DISPLAY section, use fprintf statements to display 
% the statistics for each vector. Show all values with two decimal places.
fprintf('The mean of vector 1 is %.2f\n', meanvec1)
fprintf('The range of vector 1 is %.2f\n', rangevec1)
fprintf('The standard deviation of vector 1 is %.2f\n', stdvec1)
fprintf('The mean of vector 2 is %.2f\n', meanvec2)
fprintf('The range of vector 2 is %.2f\n', rangevec2)
fprintf('The standard deviation of vector 2 is %.2f\n', stdvec2)
%% ____________________
%% COMMAND WINDOW OUTPUTS
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