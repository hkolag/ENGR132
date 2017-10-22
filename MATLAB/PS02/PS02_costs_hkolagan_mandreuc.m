%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%  	...
%
% Assigment Information
%   Assignment:  	    PS 02, Problem 2
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005
%   Paired Programmer:  Michael Andreucci, ,mandreuc@purdue.edu
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
  year2= adj_fare(:,1) %year
  avg_fare= adj_fare(:,2) %adjusted average fare dollars
%% ____________________
%% FUEL COST PLOT
% a. Create a scatter plot that you can use to determine what effect fuel price has on fuel
% costs.
% b. Format the plot with a descriptive title, useful axes labels with units, and gridlines.
Fuel=csvread(csv_file, 1, 0);

plot(cost,price,'ro')
xlabel('Fuel Cost Billions ($)');
ylabel('Fuel Price (Dollars/Gallon)');
grid
title('Fuel Price vs. Fuel Cost')
%% ____________________
%% AIRFARE MODEL CALCULATIONS
c = year(:,1)-1999
% a. Calculate the modelled average airfare for each year (by count).
A_nom=(.623* c.^2 - 5.832 * c + 330.57)
% b. Calculate the modelled adjusted airfare for each year (by count).
A_adj=(.956* c.^2 - 19.841 * c + 469.5)
%% ____________________
%% AIRFARE MODEL & DATA PLOT
%a. Create a second figure that contains a single plot with both models.
plot(year, A_nom, 'b--')
hold on
plot(year,A_adj, 'r')
% b. Overlay the actual average airfare and inflation-adjusted airfare provide in the data files.
% c. Format the plot with a descriptive title, useful axes labels with units, and gridlines. 
% Each model must be a different style and color. Each set of data points must be a different marker 
% style but match the color of its model. Add a legend and label the models and data sets appropriately.
plot(year, airfare,'sb')
plot(year, avg_fare, 'rx')
xlabel('Year')
ylabel('Airfare in Dollars')
grid
title('Average Airfare compared to Inflation Adjusted Airfare')
legend('Average Airfare Model', 'Adjusted Airfare Model',...
       'Actual Average', 'Actual Inflation-Adjusted')
%% ____________________
%% ANALYSIS

%% -- Q1
% Q1: In Problem 2, Figure 1, what type of trend do you see in the plot? Does fuel cost reflect fuel
% price?

% The trend is a near positive linear slope, which shows that the fuel cost
% and fuel price are a direct relationship to one another

%% -- Q2
%Q2: In Problem 2, Figure 2, what is happening to airfare prices from 2000-2015? Refer to both the
%average fares and the inflation-adjusted fares in your answer.

% The average airfare model shows that the price of airfare started at a low rate of $330 
% and then drastically increased to $400 in 2015.

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.

