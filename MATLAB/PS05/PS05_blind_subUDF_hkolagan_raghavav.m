function [fractrans, fracabs] = PS05_blind_subUDF_hkolagan_raghavav(blind_para, Fvec)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Calculates fraction of incident radiation absorbed and transmitted
%
% Function Call
% 	[fractrans, fracabs] = PS05_blind_subUDF_hkolagan_raghavav(frac, para)
%
% Input Arguments
%   1. blind_para = A set of blind paramenters
%   2. Fvec = Fractional Values
%
% Output Arguments
%   1. fractrans = Total fraction of inicident radiation transmitted
%   2. fracabs = Total fraction of radiation absorbed
%
% Assigment Information
%   Assignment:         PS 05, Problem 2
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Vedant Srinivas Raghavan, raghavav@purdue.edu
%  	Contributor:        Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% VARIABLE ASSIGNMENTS
%Assigns values from blind_para
slatspace = blind_para(1,1);
slat_width = blind_para(1,2);
abs_const = blind_para(1,3);
shad_ang = blind_para(1,4);
slat_ang = blind_para(1,5);

%Assigns values from Fvec
F1 = Fvec(1,1);
F2 = Fvec(1,2);
F3 = Fvec(1,3);

%% ____________________
%% CALCULATIONS
%Calculates fractional values
fracabs = (abs_const * slat_width * sin(shad_ang + slat_ang))/(slatspace * (1 - F2 * (1 - abs_const)) * cos(shad_ang));
fractrans = 1 - (slat_width / slatspace) * (sin(shad_ang + slat_ang)/ cos(shad_ang)) * (1 - F1 * (1 - abs_const) - ((F2 * (1 - abs_const)^2 * (F3 + F1 * F2 *(1 - abs_const)))/(1 - F2^2 * (1 - abs_const)^2))); 

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%