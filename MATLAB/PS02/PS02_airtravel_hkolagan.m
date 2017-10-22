%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%  	...
%
% Assigment Information
%   Assignment:     PS 02, Problem 3
%   Author:         Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:        005
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% a. Import all the data from both data files using the appropriate MATLAB built-in 
% functions for the provided data file formats (i.e. .csv, .txt).

% b. Extract each data column into separate vectors, just as you did in Problem 2. Use
% descriptive variable names and add comments to explain each variable. Include units in
% the comments, where applicable.
csv_file = 'Data_US_airlines.csv';
  Fuel=csvread(csv_file, 1, 0);
  cost = Fuel(:,3); %Fuel cost in billions $$$
  price = Fuel(:,6); % Fuel price in dollars/gallon
  year = Fuel(:,1); % Year
  consump = Fuel(:,2); % Fuel consumption billions of gallons
  passenger = Fuel(:,4); % Total passengers in millions
  num_flight = Fuel(:,5); % Number of flights
  airfare = Fuel(:,7); % Average Airfare in dollars
txt_file = 'Data_adj_airfare.txt';
  adj_fare = dlmread(txt_file);
  year2= adj_fare(:,1); %year
  avg_fare= adj_fare(:,2); %adjusted average fare dollars
%% ____________________
%% TRAVEL & AIRFARE PLOTS
% a. Create a figure that contains a 2x2 arrangement of subplots. You will use the two
% subregions in the left column and only the top subregion in the right column, as follows:

% b. Subplot A must be a scatter plot that shows the number of passengers each year (i.e.,
% 2000-2015).
subplot(2,2,1)
plot(year, passenger, 'kx', 'markersize', 3)
xlabel('Year')
ylabel('Total Million Passengers')
title('Number of Passengers Each Year')
grid
% c. Subplot B must be a scatter plot that shows the number of flights each year.
subplot(2,2,2)
plot(year, num_flight, 'kx','markersize', 3)
xlabel('Year')
ylabel('Total Million Flights')
title('Number of Flights Each Year')
grid
% d. Subplot C must be a scatter plot that allows you to determine if fuel costs affect the
% average airfare price.
subplot(2,2,3)
plot(cost, airfare,'kx', 'markersize', 3)
xlabel('Fuel Cost in Billion Dollars')
ylabel('Average Airfare Price')
title('Fuel Cost vs. Average Airfare Price')
grid
%% ____________________
%% ANALYSIS

%% -- Q1
% Q1: Examine Problem 3, Figure 1, subplots A and B. Has there been an increase in flights and/or
% passengers over time? What can you say about how the number of flights relates to the
% number of passengers? Justify your answers. 

% The number of flights has decreased over time, while the number of
% passengers has increased. The overall trend of the subplot A shows a positive slope in the increase
% of passengers, while the overall trend of subplot B shows a negative
% slope in the number of flights.
%% -- Q2
% Q2: Based on Problem 3, Figure 1, subplot C, is airline fuel cost a good indicator of airfare price?
% Justify your answer.

% No because the markers on the plot seem random with no specific trend. If
% a trend was present then airline fuel cost would be a good indicator of
% airfare price.
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.