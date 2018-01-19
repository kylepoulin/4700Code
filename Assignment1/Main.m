% clear all
clearvars
clearvars -GLOBAL
close all
format shorte

set(0, 'DefaultFigureWindowStyle', 'docked')

TotalTime = 300000;
global numElectrons;
numElectrons = 100;
T = 0;
global TimeStep;
TimeStep = 1;

global xmax ymax
xmax = 200;
ymax = 100;
speed = 1;

global ElectronInfo

ElectronInfo = zeros(1,numElectrons,6);
%First2  layers = x & y positions
%Layers 3&4 = x & y velocities
%layers 5&6 = x & y angles

ElectronInfo(1,:,1) = xmax*rand(1,numElectrons);
ElectronInfo(1,:,2) = ymax*rand(1,numElectrons);

ElectronInfo(1,:,3) = speed;
ElectronInfo(1,:,4) = 2*pi*rand(1,numElectrons);;



while T<TotalTime
    T = T + TimeStep;
    UpdateInfo();
    pause(0.05);
end