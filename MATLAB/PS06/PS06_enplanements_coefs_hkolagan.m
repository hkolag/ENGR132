function [slope, y_int] = PS06_enplanements_coefs_hkolagan(season, year, data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	Accepts a string variable with the season’s name and the inputs necessary to calculate the
%   linear model coefficients of a set of a season’s x-y data
%
% Function Call
%   [slope, y_int] = PS06_enplanements_coefs_hkolagan(season, year, data)
%
% Input Arguments
%	1. season % Character String for season
%   2. year   % data for year number
%   3. data   % data for passengers for respective year and season
%
% Output Arguments
%	1. slope % Calculated slope for the model
%   2. y_int % Calculated y intercept for the model
%
% Assigment Information
%   Assignment:         PS 06, Problem 3
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION



%% ____________________
%% CALCULATIONS
% Returns the linear model coefficients as two separate variables
P1 = polyfit(year,data,1);
slope = P1(1);
y_int = P1(2);


%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
% Displays to the Command Window the linear model equation (with appropriately-named
% variables) and reference the specific season
fprintf('The linear model equation for %s is passengers = (%.2f) * year + (%.2f).\n', season, slope, y_int);


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%