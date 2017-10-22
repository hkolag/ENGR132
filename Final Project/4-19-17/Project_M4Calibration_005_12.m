function [SSE] = Project_M4Calibration_005_12(yl, yH, Tau, Ts, data, timeLabel, ~) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	Recieves the parameters determined by our algorithms and graphs the
%	piecewise function 
%
% Function Call
% 	Project_M4Calibration_005_12(yl, yH, Tau, Ts, data, timeLabel, counter)
%
% Input Arguments
%	1. yl - The lowest value of the data
%   2. yH - The highest value of the data
%   3. Tau - The time constant for a given set of data
%   4. Ts - The time step for a given set of data.
%   5. data - The data that will be recieved from the executive function.
%   6. timeLabel - More data that will be recieved from the exec function.
%   7. counter - The value of counter that is recieved from the exec
%   function and used in the UDF.
% Output Arguments
%	1. SSE - Outputs the SSE which is calculated from the values of the
%	inputs.
%
% Assignment Information
%	Assignment:         Final Project
%	Author:             Team 5, Section 12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
% if counter < 21 % For this part of the code, variable figure counter is incremented once counter lies outside of a given model number of thermocouple
%                 % The only purpose of these statements is to graph each of
%                 % the thermocouple designs' data on their own separate figures
%                 % with our algorithm data overlayed. In order to see this
%                 % you will need to unsupress the plot commands located in
%                 % this function.
%     figureCounter = 1;
% elseif counter >= 21 && counter < 41
%     figureCounter = 2;
% elseif counter >= 41 && counter < 61
%     figureCounter = 3;
% elseif counter >= 61 && counter < 81
%     figureCounter = 4;
% elseif counter >= 81 && counter < 101
%     figureCounter = 5;
% end
temp = data(:,1); %Given set of data designated as temp

%% CALCULATIONS --
if temp(1) > temp(10240) % Determines if a set of data is cooling or heating by comparing the first point with the last. This one is cooling
approximation = zeros(1,10240); %Initialize variable, approximation.
counter = 1; %Initialize counter as 1
while timeLabel(counter) < Ts %When the data timeLabel at a point equal to counter is less than Ts, have the approximation equal yH.
    approximation(counter) = yH;
    counter = counter + 1;
end
while timeLabel(counter:end) >= Ts % When the data timeLabel at a point equal to counter is greater than or equal to Ts
    approximation(counter) = yl + (yH - yl) * (exp(- (timeLabel(counter)-Ts) ./ Tau)); %Have approximation equal to the equation given to us in the project introduction file (Remove the 1 -) 
    counter = counter + 1;
end
% figure(figureCounter) %Will utilize the if statements at beginning of the
%                        %function to graph each model number in its own
%                        %figure. (For obserrvation purposes.)
% plot(timeLabel,temp,'b-')
% xlabel('Time (sec)')
% ylabel('Temperature(Celsius)')
% hold on
% plot(timeLabel(1:1:counter-1),approximation,'r-')
% axis([0 10, -50 150])
% legend('Original Data','Piecewise')
% grid on;

elseif temp(1) < temp(10240) % Same procedure for cooling data, but now for heating. (Notice how final point must be greater than first point.) 
approximation = zeros(1,10240); %Initialize variables
counter = 1;
while timeLabel(counter) < Ts %Same parameters for this while loop compared to the one in cooling
    approximation(counter) = yl; %Instead of approximation equaling yH, it is now equal to yL, this is because before the slope starts changing greatly, it's at its lowest point.
    counter = counter + 1;
end
while timeLabel(counter:end) >= Ts %Same parameters when compared to cooling data version
    approximation(counter) = yl + (yH - yl) * (1 - exp(- (timeLabel(counter)-Ts) ./ Tau)); %Same equation except it is 1 - exp.
    counter = counter + 1;
end
% figure(figureCounter) % Same plotting code utilized in the same way as the
%                        other plotting code above.
% plot(timeLabel,temp,'b-')
% xlabel('Time (sec)')
% ylabel('Temperature(Celsius)')
% hold on
% plot(timeLabel(1:1:counter-1),approximation,'r-')
% axis([0 10, -50 150])
% legend('Original Data','Piecewise')
% grid on;
end

num = sum((temp - approximation').^2); % Creates the numerator for the 'modified' SSE equation given to us in the milestone 2 answer sheet.
denom = 10240; % Creates the denominator for the 'modified' SSE equation given to us in the milestone 2 answer sheet. This number will always be the same for the data given.
SSE = num/denom; % Computes SSE using numerator and denominator.
%% FORMATTED TEXT & FIGURE DISPLAYS ---


%% COMMAND WINDOW OUTPUTS ---


%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%