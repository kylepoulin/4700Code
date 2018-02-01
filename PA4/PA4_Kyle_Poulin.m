x=30;
y=30;
deltax = 0.01;

numIterations = 10000;

V = zeros(y,x);
V(:,1)=1;
V(:,x)=1;
V(1,:)=0;
V(y,:)=0;

for iteration = 1:numIterations
    oldV = V;
    [Ex, Ey] = gradient(V(2:y-1,2:x-1));
    for j=2:y-1
       for i=2:x-1
           V(j,i) = (oldV(j,i-1)+oldV(j,i+1)+ oldV(j-1,i)+ oldV(j+1,i))/4;
       end
    end
    %THIS IS FOR PART2A)VI.
    %surf(V(2:y-1,2:x-1));
    %surf(E);
    %THIS IS FOR PART2A) VII.
    quiver(Ex,Ey);
    %contour(Ex,Ey);
    pause(0.01);
end
