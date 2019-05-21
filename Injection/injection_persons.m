clc 
clear all
close all


[F,V,N] = stlread('mesh(binary).stl');


% get the center point of each triangle face
points = V(F(:,1),:) + V(F(:,2),:) + V(F(:,3),:); 
points = points/3;

points = points + 0.01*N;  % shift outward by 0.01 m


% set the injection velocity 
vel = N*30;         % 30 m/s


% remove points outside the domain
II = points(:,3)>0;
points = points(II,:);
vel = vel(II,:);




N = length(points(:,1));


fileID = fopen('injection.inj','w');

for i=1:N
    fprintf(fileID,'%s','((');
    % ((x y z u v w diameter temperature mass-flow) name )
    fprintf(fileID,'%.3f %.3f %.3f %.3f %.3f %.3f %.2e %d %.2e', ... 
        points(i,1),points(i,2),points(i,3),vel(i,1),vel(i,2),vel(i,3),12e-6,300,(1e-20)/N);
    fprintf(fileID,'%s',')');
    fprintf(fileID,'\t%d%s\n',i,')');
end

fclose(fileID);