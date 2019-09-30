%% Depth-first search algorithm for pathfinding

clear all;
close all;
clc;
rng(201);

sizex=8;
sizey=8;
starting=[sizey,1];
finish=[1,sizex];

P=zeros(sizex,sizey);

%% Generate map
for i=1:sizex
    for j=1:sizey
        r=rand(1);
        if(r>0.75)
            P(i,j)=100; % it's a wall
            M(i,j)='X';
        else
            if(j>3 && j<8)
                P(i,j)=10;
                M(i,j)='*';
            else
                P(i,j)=1;
                M(i,j)='.';
            end
        end
    end
end
P(starting(1),starting(2))=1;
P(finish(1),finish(2))=1;

figure('Name','Solution','NumberTitle','off');
hold on;
for i=1:sizex
    for j=1:sizey
        plot_on_map(i,j,P,'k','k')
    end
end

x0=0;
y0=0;
width=720;
height=720;
set(gcf,'units','points','position',[x0,y0,width,height])
xlim([0,sizex+1]);
ylim([0,sizey+1]);


%% generate animated video
writerObj = VideoWriter('DFS.avi'); 
open(writerObj);
writeObj.FrameRate = 5;

F = getframe;
writeVideo(writerObj,F);


%% DFS algorithm
import java.util.Stack          % Import queue structure from java
 q = Stack();                   % q.add('item1'); add item to the end of queue
                                % item = q.remove(); rempve first item of
                                % queue and save it as item
Past = zeros();                              
iter=0;
                                
current=starting;
Past=current;
cost=0;
current_cost=cost;
Past=current;
Previous=current;
x=current(1);
y=current(2);
Break=0

while([current(1)~=finish(1) ||current(2)~=finish(2)])
    plot_on_map(x,y,P,'b','g')
    F = getframe;
    writeVideo(writerObj,F);
    % add sorrounding points to queue
    current_cost=cost(check_vector(Past,current))+P(x,y);
    %[Past,Previous,cost.']
    
    for i=x-1:x+1
        for j=y-1:y+1
            if (i>0 && i<=sizex && j>0 && j<=sizey)     % if inside map
                if (P(i,j)<100 && (i~=x || j~=y))        % if not current x,y and not a wall
                   found=check_vector(Past,[i,j]);      % if not already present in past list
                   if(found==0)
                      q.push([i,j].');
                      Past=[Past;[i,j]];
                      Previous=[Previous;current];
                      cost=[cost,current_cost];
                      plot_on_map(i,j,P,'g','g')
                      F = getframe;
                      writeVideo(writerObj,F);
                      if (i==finish(1) && j==finish(2))
                        Break=1;
                        break;
                      end
                   else
                      if (cost(found)>current_cost)
                          Previous(found,:)=[x,y];
                          cost(found)=current_cost;
                      end
                   end
                end
           end
        end
        if (Break)
            break;
        end
    end
    if (Break)
        break;
    end
    
    plot_on_map(x,y,P,'r',[1 .6 .6])
    F = getframe;
    writeVideo(writerObj,F);
    
    % update current and cost
    current=q.pop().';
    x=current(1);
    y=current(2);
    iter=iter+1
end

current_cost
current=finish;
while(current~=starting)
    current;
    plot_on_map(current(1),current(2),P,'b','b')
    F = getframe;
    writeVideo(writerObj,F);
    
    of_current=check_vector(Past,current);
    current=Previous(of_current,:);
end
    plot_on_map(current(1),current(2),P,'b','b')
    F = getframe;
    plot_on_map(starting(1),starting(2),P,'b','b')
    F = getframe;
hold off;   
close(writerObj);
