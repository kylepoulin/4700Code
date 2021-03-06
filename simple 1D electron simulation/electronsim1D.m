force = 9.11*(10^-31);
m = 9.109*(10^-31);
a = force/m;

particleNum = 1000;

vsum = zeros(1,particleNum);

epos = zeros(1,particleNum);
ev = zeros(1,particleNum);
average= zeros(1,particleNum);

timestep = 1;
finalTime = 100000000;

scattered = zeros(1,particleNum);

oldx = zeros(1,particleNum);
oldv = zeros(1,particleNum);
oldaverage = zeros(1,particleNum);


for i = 0:timestep:finalTime
    
    for j = 1:particleNum
        
    if(scattered(j)==1)
        ev(j) = 0;
    end
    oldx(j) = epos(j);
    oldv(j) = ev(j);
    oldaverage(j) = average(j);
    
    ev(j) = ev(j) + timestep*a;
    epos(j) = epos(j) + timestep*ev(j);
    
    vsum(j) = vsum(j) + ev(j);
    average(j) = vsum(j)/i;
    
    if(rand()<0.05)
        scattered(j) = 1;
    else
        scattered(j) = 0;
    end
    
    end
    
    subplot(2,1,1);
    plot([i-1 i],[mean(oldx) mean(epos)]);
    hold on;
    title(mean(average));
    subplot(2,1,2);
    plot([i-1 i], [mean(oldv) mean(ev)]);
    hold on;
    
    %subplot(3,1,3);
    %plot([i-1 i], [oldaverage average]);
    %hold on;
    pause(0.01);
    
    
    
end
