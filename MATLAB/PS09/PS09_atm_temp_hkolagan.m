function [layer, aTemp] = PS09_atm_temp_hkolagan(height)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Uses information from the US Standard Atmosphere 1976 to calculate the 
%   idealized temperature at any altitude below 51 kilometers and states
%   where in the atmosphere the altitude is located.
%
% Function Call
%   [layer, aTemp] = PS09_atm_temp_hkolagan(height) 	
%
% Input Arguments
%   1. height
%
% Output Arguments
%   1. layer
%   2. aTemp 
%
% Assigment Information
%   Assignment:  	    PS 09, Problem 2
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Strings
layerTrps = 'Troposphere';
layerTrp = 'Tropopause';
layerStr = 'Stratosphere';
layerStrp = 'Stratopause';

% Base Temp, Base Height, Temp Lapse Arrays
Trps = [288.15 0 -6.5];
Trp = [216.65 11 0];
Str3 = [216.65 20 1];
Str4 = [228.65 32 2.8];
Strp = [270.65 47 0];

%% ____________________
%% CALCULATIONS
if (height >= 0 && height < 11)
    aTemp = Trps(1) + Trps(3)*(height - Trps(2));
    layer = layerTrps;
elseif (height >= 11 && height < 20)
    aTemp = Trp(1) + Trp(3)*(height - Trp(2));
    layer = layerTrp;
elseif (height >= 20 && height < 32)
    aTemp = Str3(1) + Str3(3)*(height - Str3(2));
    layer = layerStr;
elseif (height >= 32 && height < 47)
    aTemp = Str4(1) + Str4(3)*(height - Str4(2));
    layer = layerStr;
elseif (height >= 47 && height < 51)
    aTemp = Strp(1) + Strp(3)*(height - Strp(2));
    layer = layerStrp;
else
    fprintf('Error. Height Outside Boundaries');
end

%% ____________________
%% FORMATTED TEXT DISPLAYS
fprintf('Atmospheric Temperature = %.2f K\n', aTemp)
fprintf('Atmospheric Layer = %s\n', layer)

%% ____________________
%% COMMAND WINDOW OUTPUTS
% For each test case, paste the function call and results displayed in the 
% Command Window as comments under the COMMAND WINDOW OUTPUTS section of 
% your function file.

% PS09_atm_temp_hkolagan(10)
% Atmospheric Temperature = 223.15 K
% Atmospheric Layer = Troposphere

% PS09_atm_temp_hkolagan(19)
% Atmospheric Temperature = 216.65 K
% Atmospheric Layer = Tropopause

% PS09_atm_temp_hkolagan(30)
% Atmospheric Temperature = 226.65 K
% Atmospheric Layer = Stratosphere

% PS09_atm_temp_hkolagan(34)
% Atmospheric Temperature = 234.25 K
% Atmospheric Layer = Stratosphere

% PS09_atm_temp_hkolagan(50)
% Atmospheric Temperature = 270.65 K
% Atmospheric Layer = Stratopause

% PS09_atm_temp_hkolagan(-1)
% Error. Height Outside Boundaries

% PS09_atm_temp_hkolagan(52)
% Error. Height Outside Boundaries

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%