function [predVal, rsq] = PS06_enplanements_predict_hkolagan(slope, y_int, year, data, season)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	
%
% Function Call
%   [predVal, rsq] = PS06_enplanements_predict_hkolagan(slope, y_int, year, data, season)
%
% Input Arguments
%   1. slope  % Calculated slope for the data
%   2. y_int  % Calculated y intercept
%   3. year   % Data for year number
%   4. data   % Data for passengers for respective year and season
%   5. season % Character String for season
%
% Output Arguments
%	1. predVal % Vector of f(x) values from derived linear model
%   2. rsq     % R squared value for the linear model
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
% Returns the linear model’s predicted values as a vector and the r2 value for the linear model
% as a scalar
predVal= slope * year + y_int;
SSE = mean((predVal - data).^2);
SST = mean((data - mean(data)).^2);
rsq = 1 - SSE/ SST;

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
% Displays to the Command Window the season’s r2 value and refers to the specific season in
% the statement
fprintf('The R squared value for the %s linear model is %.4f.\n', season, rsq);


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%