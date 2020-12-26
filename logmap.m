%% Logistic Map
%Direct and sequential building of the map
%% Author: Diego Ciccia


%% Logistic Map for a given rate of growth

%The population of a given environment, belonging to [0, 1], grows at a 
%given rate r for each period of time given the constraint 1 minus the 
%previous period population.
%We get recurrent patterns by changing the value of r between 0 and 4.
%The following code displays the formation of such patterns.

N=500;%n° of periods
seq=zeros(N,1);%vector of the population level at each period
n=rand();%starting population, random
% n=0.5;%uncomment to enter a given starting population
seq(1,1)=n;
r= 3.5;%rate of growth

scatter(1,seq(1,1), '.', 'b');
drawnow
hold on
grid on

for i=2:N
    seq(i,1)=seq(i-1,1)*(1-seq(i-1))*r;
    scatter(i,seq(i,1), '.', 'b');
    drawnow%comment to obtain just the final result
    hold on
end

%% Logistic map for each level of rate of growth

%The following code displays the value(s) at which the logistic function
%converges at each level of rate of growth. The index S determines,
%starting from the last period, how many observations will be plotted, such
%that, the higher S, the more tight the representation will be. However, it
%is better to keep S at least 100 units less than N, in order to avoid the
%representation of the first sequences, which will alter the shape of the
%map.

N=500;%n° of periods
[a, R]=size(0.01:0.01:4);%n° of rates
seq=zeros(N,1);%vector of the population level at each period
n=rand();%starting population, random
% n=0.5;%uncomment to enter a given starting population
seq(1,1)=n;
S=300;%n° of observation for each path
seqV=zeros(R,S);%matrix which contains the observations acquired for each rate

for r=0.01:0.01:4
    o=round(r*100);
    for i=2:N
        seq(i,1)=seq(i-1,1)*(1-seq(i-1))*r;
    end 
    for j=1:S
        seqV(o,j)=seq(N-j+1,1);
    end
end


axis=0.01:0.01:4;
for j=1:S
    scatter(axis,seqV(:,j), '.', 'b')
%     drawnow %uncomment to show the building of the map
    hold on
    grid on
end

    
