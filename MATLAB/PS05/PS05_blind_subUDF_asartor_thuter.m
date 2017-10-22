function [Fvec] = PS05_blind_subUDF_asartor_thuter(blind_para)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Calculates fractional values for given values using a set of equations
%
% Function Call
% 	[Fvec] = PS05_blind_subUDF_asartor_thuter(blind_para)
%
% Input Arguments
%   1. blind_para = Blind Parameters
%
% Output Arguments
%   1. Fvec = Fractional Values
%
% Assigment Information
%   Assignment:         PS 05, Problem 2
%   Author:             Andrew Sartorio, asartor@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Tyler Huter, thuter@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% VARIABLE ASSIGNMENTS
%Assigns appropiate variable to corresponding vector element
S = blind_para(1,1); 
W = blind_para(1,2);
psi = blind_para (1,5);

%% ____________________
%% CALCULATIONS
%Computes the desired fractional values according to the given equations
F1radical = sqrt(1+(S/W)^2+2*(S/W)*sin(psi));
F1 = .5*(1+(S/W)-F1radical);
F2radical = sqrt(1+(S/W)^2-2*(S/W)*sin(psi));
F2 = .5*(F1radical + F2radical - 2*(S/W));
F3 = .5*(1+(S/W)-F2radical);

Fvec = [F1 F2 F3];

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%