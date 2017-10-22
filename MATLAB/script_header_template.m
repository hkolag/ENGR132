%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	This script ...
%
% Assignment Information
%	Assignment:         PS 01, Problem 5
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005
%  	Contributor:        Name, login@purdue [repeat for each contributor]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
A =[2 5 8 5; 10 9 1 4; 6 3 2 10]

%% CALCULATIONS ---
m = A(2,3);    % Assigns value of specified location in matrix A to m
%s = A(5,4);   % There is no row 5 that exists
B = A(1,:);    % Assigns values in the first row of array A
C = A(2,:);    % Assigns values in the second row of array A
D = A(:,3);    % Assigns value of the third number in each row
E = sort(D);   % Sorts the values in the Column D from least to greatest
A(2,4) = 40;   % Assigns value of 40 to the specified location in array A
F = A(1:2);    % Assigns values of the first number in the first 2 rows of array A
G = A(2:3);    % Assigns values of the first number in the second 2 rows of array A
H = A(1:2,2:3);% Assigns values of the first 2 number in the first 2 rows of array A
J = [C B];     % Assigns values of C and B in one row
K = [C;B];     % Assigns values of C and B in seperate rows
%L = [D C];    % Dimensions of each variable are different

%% FORMATTED TEXT & FIGURE DISPLAYS ---


%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%


