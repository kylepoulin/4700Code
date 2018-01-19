function [  ] = UpdateInfo(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global ElectronInfo numElectrons
global TimeStep
global xmax ymax

for i = 1:numElectrons
    %X position update
    newX = ElectronInfo(1,i,1) + TimeStep*ElectronInfo(1,i,3)*cos(ElectronInfo(1,i,4));
    if newX > xmax
        newX = newX - xmax;
    elseif newX < 0
        newX = newX + xmax;
    end
    ElectronInfo(1,i,1) = newX;
    
    %Y position update
    newY = ElectronInfo(1,i,2) + TimeStep*ElectronInfo(1,i,3)*sin(ElectronInfo(1,i,4));
    if newY > ymax
        newY = ymax - (newY-ymax);
        ElectronInfo(1,i,4) = -ElectronInfo(1,i,4);
    elseif newY < 0
        newY = -newY;
        ElectronInfo(1,i,4) = -ElectronInfo(1,i,4);
    end
    ElectronInfo(1,i,2) = newY;
end

plot(ElectronInfo(1,:,1),ElectronInfo(1,:,2), 'r.', 'MarkerSize', 30);
xlim([0 xmax]);
ylim([0 ymax]);
end

