function [] = PS08_yieldcompare_hkolagan_raghavav()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   uses relational and logical operators and associated built-in functions,
%   as appropriate, to answer the questions in Step 2.
%
% Function Call
% 	PS08_yieldcompare_hkolagan_raghavav()
%
% Input Arguments
%   NONE
%
% Output Arguments
%   NONE
%
% Assigment Information
%   Assignment:  	    PS 08, Problem 2
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Vedant Srinivas Raghavan, raghavav@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format compact

%% ____________________
%% INITIALIZATION
allData = load('Data_corn_yield.txt');
year = allData(10,:);
NW = allData(1,:);
NC = allData(2,:);
NE = allData(3,:);
WC = allData(4,:);
C = allData(5,:);
EC = allData(6,:);
SW = allData(7,:);
SC = allData(8,:);
SE = allData(9,:);

%% ____________________
%% CALCULATIONS
% Number of years in which the west central district have yields higher than the east central district, the central
% district, or the average yield for the whole Central region.
A1 = sum([(WC > EC) | (WC > C) | (WC > ((C + WC + EC)/3))])

% Year(s) in which the west central district have higher yields than both the northwest district and the
% southwest district.
B1 = find(((WC > NW) & (WC > SW)) ~= 0);

B2 = year(B1);

% Year(s) in which the Southern region have an average yield lower than the Central region average or
% the Northern region average
C1 =  (((C + WC + EC)/3) > ((SE + SC + SW)/3)) | (((NE + NW + NC)/3) > ((SE + SC + SW)/3));

C2 = year(C1);

% Number of years was the Northern region’s average higher than the Southern region’s average but lower
% than the Central region’s average.
D1 = sum((((NE + NW + NC)/3) > ((SE + SC + SW)/3)) & (((NE + NW + NC)/3) < ((C + WC + EC)/3))); 
%% ____________________
%% FORMATTED TEXT DISPLAYS
% Display all answers clearly in the MATLAB Command Window. Do not hardcode any values in the fprintf
% statements.
fprintf('\nThe West Central district had yields higher than the East Central district, the central district, or the average yield for the whole Central region for %d years\n', A1)
fprintf('\nWest central district had higher yields than both the northwest district and the southwest district during ')
disp(B2)
fprintf('\nThe Southern region had an average yield lower than the Central region average or the Northern region average during ')
disp(C2)
fprintf('\nThe Northern region’s average was higher than the Southern region’s average but lower than the Central region’s average for %d years\n', D1)

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%