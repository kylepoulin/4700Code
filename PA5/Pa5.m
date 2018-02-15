nx = 50;
ny = 50;

deltaxy = 1;

G = sparse(nx*ny);



for i = 1:nx
    for j = 1:ny
        n= j + (i-1)*ny;
        
        if i==1
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i == nx
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j ==1
            G(:,n) = 0;
            G(n,n) = 1;
        elseif j ==ny
            G(:,n) = 0;
            G(n,n) = 1;
        else
            G(n,n) = -4;
            G(n,j+(i-2)*ny) = 1;
            G(n,j+i*ny) = 1;
            G(n,j+1+(i-1)*ny) = 1;
            G(n,j-1+(i-1)*ny ) = 1;
        end
    end   
end

[E,D] = eigs(G,9,'SM')

V = zeros(nx,ny,9);

for i= 1:9
    V(:,:,i) = reshape(E(:,i), nx, ny);
    
end
surf(V(:,:,1));

