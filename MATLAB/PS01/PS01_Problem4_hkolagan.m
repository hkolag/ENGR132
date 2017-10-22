%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	This script ...
%
% Assignment Information
%	Assignment:         PS 01, Problem 4
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
rowA1 = [0 1 2 3 4 5] 
rowA2 = [0,1,2,3,4,5]
rowA3 = 0:5
rowA4 = 0:1:5
rowA5 = linspace(0, 5, 6)
rowB1 = [4 2 0 -2]
rowB2 = [4,2,0,-2]
rowB3 = 4:-2:-2
rowC1 = -5:1:5
rowC2 = -5:5
rowC3 = linspace(-5, 5, 11)
columnA1 = [0;1;2;3;4;5]
columnA2 = transpose(rowA1) 
columnA3 = rowA2'
columnA4 = (0:5)'
columnB1 =(-5:5)' 
columnB2 = rowC2'
columnB3 = transpose(rowC1)
value1 = 3
%% CALCULATIONS ---
x = rowA1(3)	           % Assigns the 3rd element of rowA1 to x
y = columnA1(4)           % Assigns the 4th element of columnA1 to y
vecA = rowA1 + rowA1      % Assigns values of the sum of the rows to vecA
%vecB = rowA1 + rowB1       Matrix dimentions are not the same
vecC = rowA1 + 3          % Adds 3 to each element int rowA1
vecD = rowA1 - rowA1      % Assigns values of the difference of the rows to vecD
%vecE = rowA1 - rowC1;       Matrix dimensions are not the same
%vecF = columnA1 + columnB1; Column dimensions are not the same
result1 = rowA1 * value1   % Element-by-element multiplication 
					       % by a scalar
result2 = rowA1 .* value1  % Element-by-element multiplication 
					       % by a scalar; the period character is 
					       % NOT necessary.
%result3 = rowA1 * rowA1     Inner matrix dimensions must agree
result4 = rowA1 .* rowA1   % Element-by-element multiplication 
					       % by a scalar
%result5 = rowA1 .* rowB1    Matrix dimensions are not the same   
result6 = rowA1 .* columnA1% Element-by-element multiplication 
					       % by a scalar; the period character is 
					       % NOT necessary.
result7 = rowA1 / value1   % Element-by-element division 
					       % by a scalar
result8 = rowA1 ./ value1  % Element-by-element division 
					       % by a scalar; the period character is 
					       % NOT necessary.
result9 = rowA1 / rowA1    % Operation uses matrix math
result10 = rowA1 ./ rowA1  % Element-by-element division 
					       % by a scalar
%result11 = rowA1 ./ rowB1   Matrix dimensions are not the same
result12 = rowA1 ./ columnA1% Element-by-element divison 
					        % by a scalar
%result13 = rowA1 ^ value1 % Inputs are not scalar
result14 = rowA1 .^ value1 % Element-by-element power
                           % by a scalar
%result15 = rowA1 ^ rowA1  % Inputs are not scalar
result16 = rowA1 .^ rowA1  % Element-by-element power
                           % by a scalar
%result17 = rowA1 .^ rowB1   Matrix dimensions are not the same  
result18 = rowA1 .^ columnA1% Element-by-element power
                            % by a scalar 
s = [0.1 0.6 0.9]
t = [8.2 8.4 9.1]
a = s .* t.^2 - ((2.*t) / (3.*s))^(3/5)
b = (0.5 * t)./(20*x.*s.^3)+(exp(-s.*t)/(s + t))
%% FORMATTED TEXT & FIGURE DISPLAYS ---


%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%


