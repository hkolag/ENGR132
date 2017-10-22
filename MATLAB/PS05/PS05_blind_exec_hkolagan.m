function [] = PS05_blind_exec_hkolagan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	Determines the transmission, absorption, and reflection of solar energy through
%   horizontal venetian blinds.
%
% Function Call
% 	PS05_blind_exec_hkolagan()
%
% Input Arguments
%	NONE
%
% Output Arguments
%	NONE
%
% Assigment Information
%   Assignment:    PS 05, Problem 2
%   Author:        Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:       005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Defines blind parameters
blind_para = [30 35 0.52 deg2rad(10) deg2rad(30)];

%Executes first UDf function
[Fvec] = PS05_blind_subUDF_asartor_thuter(blind_para);

%Executes second UDF Function
[fractrans, fracabs] = PS05_blind_subUDF_hkolagan_raghavav(blind_para, Fvec);

%% ____________________
%% CALCULATIONS
%Calculates total reflected fraction of light
ref = 1 - fracabs - fractrans;

slatang = blind_para(1,5);


%% ____________________
%% FORMATTED TEXT DISPLAY
fprintf('When the slat angle is %.2f deg, the transmission is %.2f, the absorption is %.2f, and the reflection is %.2f.\n', rad2deg(slatang), fractrans, fracabs, ref) 

%% ____________________
%% COMMAND WINDOW OUTPUTS
%PS05_blind_exec_hkolagan()
%When the slat angle is 20.00 deg, the transmission is 0.48, the absorption is 0.39, and the reflection is 0.13.

%PS05_blind_exec_hkolagan
%When the slat angle is 30.00 deg, the transmission is 0.32, the absorption is 0.49, and the reflection is 0.18.

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%