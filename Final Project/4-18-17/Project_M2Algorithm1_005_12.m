function [yl, yH, Tau,ts] = Project_M2Algorithm1_005_12()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	Algorithm 1
%
% Function Call
% 	Project_M2Algorithm1_005_12(HCC)
%
% Input Arguments
%	1. Heating Clean Calibration data
%
% Output Arguments
%	1. yl, yH, Tau, Ts
%
% Assignment Information
%	Assignment:         Milestone 2 Algorithm 1
%	Author:             Tyler Huter, thuter@purdue.edu
%  	Team ID:            005-12     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
x = HCC(:,1)';
y = HCC(:,2)';
std_tolerance = 2.8;
slope_avg = 0;
counter_1 = 1;
counter_2 = 5;
starting_pt = 1;
ending_pt = 200;
veca_to_b = [starting_pt:1:ending_pt];
%% CALCULATIONS ---

iteration_counter = 0;
vec_dimension = 1;
while iteration_counter < 4
    starting_pt = 1;
    ending_pt = 200;
    for counter = 1:200:10200
        if iteration_counter < 1
         y_smoothrng_pts = y(starting_pt:1:ending_pt);
         x_smoothrng_pts = x(starting_pt:1:ending_pt);
         smooth_y(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
         smooth_x(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
         starting_pt = starting_pt + 200;
         ending_pt = ending_pt + 200;
        elseif iteration_counter < 2 & iteration_counter > 0
                y_smoothrng_pts = smooth_y(starting_pt:1:ending_pt);
                x_smoothrng_pts = smooth_x(starting_pt:1:ending_pt);
                smoother_y(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                smoother_x(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                starting_pt = starting_pt + 200;
                ending_pt = ending_pt + 200;
         elseif  iteration_counter < 3 & iteration_counter > 1 
                     y_smoothrng_pts = smoother_y(starting_pt:1:ending_pt);
                     x_smoothrng_pts = smoother_x(starting_pt:1:ending_pt);
                     smooth_y_third(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                     smooth_x_third(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                     starting_pt = starting_pt + 200;
                     ending_pt = ending_pt + 200;
        elseif iteration_counter < 4 & iteration_counter > 2
             x_data_final(vec_dimension) = (sum(smooth_x_third(starting_pt:1:ending_pt))./200);
             y_data_final(vec_dimension) = (sum(smooth_y_third(starting_pt:1:ending_pt))./(200));
             starting_pt = starting_pt + 200;
             ending_pt = ending_pt + 200;
             vec_dimension = vec_dimension + 1;
        end
       end
    iteration_counter = iteration_counter + 1;
end

point_initial = 1;
point_final = 5;
length_y = length(y_data_final);
y_finalvalue = y_data_final(length_y);
if y_finalvalue > y_data_final(1)
while abs(slope_avg) > 0
        x_data = x_data_final(point_initial:point_final);
        y_data = y_data_final(point_initial:point_final);
        slope_vec(1) = (y_data(2)-y_data(1))/(x_data(2)- x_data(1));
        slope_vec(2) = (y_data(3)-y_data(2))/(x_data(3)- x_data(2));
        slope_vec(3) = (y_data(4)-y_data(3))/(x_data(4)- x_data(3));
        slope_vec(4) = (y_data(5)-y_data(4))/(x_data(5)- x_data(4));
    
        slope_avg = mean(slope_vec);
        point_initial = point_initial+1;
        point_final = point_final+1;
end 
yl = min(y_data_final);
yH = max(y_data_final);
ts = x_data_final(point_final);
tau_discovery = 0;
g = 1
while tau_discovery <= yH*.632
    tau_discovery = y_data_final(g);
    g = g + 1;
end
 Tau_xcord = x_data_final(g);
 Tau = Tau_xcord - ts;
 
elseif y_finalvalue < y_data_final(1)
    while abs(slope_avg) <=40
        x_data = x_data_final(point_initial:point_final);
        y_data = y_data_final(point_initial:point_final);
        slope_vec(1) = (y_data(2)-y_data(1))/(x_data(2)- x_data(1));
        slope_vec(2) = (y_data(3)-y_data(2))/(x_data(3)- x_data(2));
        slope_vec(3) = (y_data(4)-y_data(3))/(x_data(4)- x_data(3));
        slope_vec(4) = (y_data(5)-y_data(4))/(x_data(5)- x_data(4));
    
        slope_avg = mean(slope_vec);
        point_initial = point_initial + 1;
        point_final = point_final + 1;
    end
    ts = x_data_final(point_initial);
    yl = min(y_data_final);
    while slope_avg < -1
        x_data = x_data_final(point_initial:point_final);
        y_data = y_data_final(point_initial:point_final);
        slope_vec(1) = (y_data(2)-y_data(1))/(x_data(2)- x_data(1));
        slope_vec(2) = (y_data(3)-y_data(2))/(x_data(3)- x_data(2));
        slope_vec(3) = (y_data(4)-y_data(3))/(x_data(4)- x_data(3));
        slope_vec(4) = (y_data(5)-y_data(4))/(x_data(5)- x_data(4));
    
        slope_avg = mean(slope_vec);
        point_initial = point_initial + 1;
        point_final = point_final + 1;
    end
    yH = max(y_data_final);
    
    tau_discovery = 0;
    g = 1;
    while tau_discovery <= yH*.632
        tau_discovery = y_data_final(g);
        g = g+1;
    end
    Tau_xcord = x_data_final(g);
    Tau = abs(Tau_xcord - ts);
end

%% FORMATTED TEXT & FIGURE DISPLAYS ---

%% COMMAND WINDOW OUTPUTS ---


%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%