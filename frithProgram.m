%Project Power and Efficiency Calculator, 12/5/21, RATPAKK

clear; %clears the workspace
clc; %clears up the commands window


choice = input('Input the turbine for results: ', 's');

%The next line imports a spreadsheet and converts it to a matrix 
fileName = strcat(choice,'FrithData.xlsx');
data = readmatrix(fileName);

%The next block of code takes data from specific columns 
%within the matrix and assigns that data to a variable
resistance = data(:,1);
volts = data(:,2);

%The next block of code instantiates two variavles to help
%us calculate maximum power and total power in our loop
totalPower = 0;
maxPower = 0;

%The next block of code runs through all of the data and
%calculates power for each instance where the data was recorded.

%It adds the power values calculated at each instance to a 
%variable that will help us calculate average power.

%It uses an if statement to determine the largest power value 
%for all of the instances.
for i = 1:numel(volts)
    power = volts(i)^2/resistance(i);
    if power > maxPower
       maxPower = power;
    end
    totalPower = totalPower + power;
end

%The next line of code calculates average power by dividing
%the total power by the number of instances.
avgPower = totalPower/70;

%The next block of code helps us calculate efficiency by instantiating
%variables for air density and swept area. It then uses those variables
%to calcualte maximum efficiency recorded.
density = 1.25;
sweptArea = 12;
efficiency = ((2*maxPower)/(density*sweptArea*4.2^3));

%The next block of code prints the max power and avg power
fprintf('The average power produced is %5.6f', avgPower);
fprintf('\nThe maximum power produced was %5.6f', maxPower);
fprintf('\nThe maximum efficiency recorded was %5.6f', efficiency);