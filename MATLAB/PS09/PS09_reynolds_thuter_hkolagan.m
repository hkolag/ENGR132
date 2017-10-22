function [Reynolds_num] = PS09_reynolds_thuter_hkolagan(flu_density,flu_velocity,pipe_diameter,flu_viscosity)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Takes the fluid density, velocity, viscosity and pip diameter and
%   calculates the reynolds number of the system as well as what flow type
%   the system has.
%
% Function Call
% 	PS09_reynolds_thuter_hkolagan(flu_density,flu_velocity,pipe_diameter,flu_viscosity)
%   (Note: The inputs should all be numeric values.)
%
% Input Arguments
%   1. flu_density
%   2. flu_velocity
%   3. pipe_diameter
%   4. flu_viscosity
% Output Arguments
%   1. Reynolds_num
%
% Assigment Information
%   Assignment:  	    PS 09, Problem 1
%   Author:             Tyler Huter, thuter@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Harith Kolaganti, hkolagan@purdue.edu
%  	Contributor:        Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Valid set of values for published file.
flu_density = .5
flu_velocity = 5
pipe_diameter = .07
flu_viscosity = 3

%Creates a range of values for fluid density, and designates an error
%message for any values outside of that range.
if flu_density < 0.5 | flu_density > 1500
    error('invalid density')
end

%Creates a range of values for fluid velocity, and designates an error
%message for any values outside of that range.
if flu_velocity < 0 | flu_velocity > 10
    error('invalid velocity')
end

%Creates a range of values for pipe diameter, and designates an error
%message for any values outside of that range.
if pipe_diameter < 0.05 | pipe_diameter > 0.2
    error('invalid diameter')
end

%Creates a range of values for fluid viscosity, and designates an error
%message for any values outside of that range.
if flu_viscosity < .001 | flu_viscosity > 25
    error('invalid viscosity')
end

%% ____________________
%% CALCULATIONS
Reynolds_num = flu_density*flu_velocity*pipe_diameter/flu_viscosity; 
%calculates the value of the Reynold's number of the system given a set of
%values.


%% ____________________
%% FORMATTED TEXT DISPLAYS
%Prints the values of all of the variables utilized in the program.
%(Including the Reynold's number.)
fprintf('The value for fluid density is, %.3f\n', flu_density);
fprintf('The value for fluid velocity is, %.3f\n', flu_velocity);
fprintf('The value for pipe diameter is, %.3f\n', pipe_diameter);
fprintf('The value for fluid viscosity is, %.3f\n', flu_viscosity);
fprintf('The value of the Reynolds Number is, %.3f\n', Reynolds_num);
%% ____________________
%% COMMAND WINDOW OUTPUTS
%Designates what ranges of the Reynold's number are associated with which
%flow types.
if Reynolds_num < 2300
    fprintf('Flow Type: laminar\n');
elseif Reynolds_num > 4800
        fprintf('Flow Type: turbulent\n');
else
        fprintf('Flow Type: transitional\n');
end

%PS09_reynolds_thuter_hkolagan(.5,11,.01,1)
%Invalid velocity
%PS09_reynolds_thuter_hkolagan(.5,1,.03,1)
%Invalid diameter
%PS09_reynolds_thuter_hkolagan(.5,1,.01,26)
%Invalid viscosity
%PS09_reynolds_thuter_hkolagan(.5,1,.05,25)
%Flow type: laminar
%PS09_reynolds_thuter_hkolagan(1500,10,.2,.001)
%Flow type: turbulent
%PS09_reynolds_thuter_hkolagan(75,5,.07,.01)
%Flow type: transitional
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%