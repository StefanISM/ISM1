
MESSFREQUENZ_HZ=1e6;
%% 

load('.\AufnahmenNeu\Michi.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

markerPoints = size(Michi);

marker1.t = zeros(markerPoints(1), 1);
marker1.d = zeros(markerPoints(1), 3);

marker2.t = zeros(markerPoints(1), 1);
marker2.d = zeros(markerPoints(1), 3);

marker3.t = zeros(markerPoints(1), 1);
marker3.d = zeros(markerPoints(1), 3);


clear windowOld;
clear windowData;
for k = 1:markerPoints(1)
    
    if (~exist('windowData') )
        windowData = Michi(k,:);
    else
        windowSize = size(windowData);
        if (windowData{1,1} == Michi{k,1})
            windowData(windowSize(1)+1,:) = Michi(k,:);
        else
            if ~exist('windowOld')
                
                for l = 1:windowSize(1)
                    if ( windowData{l,2} == 0)
                        marker1.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker1.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];

                    elseif (  windowData{l,2} == 1 )
                        marker2.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker2.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];

                    elseif(windowData{l,2} == 2)
                        marker3.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker3.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];
                    end
                    
                end
                goodIndices = 1:3;
            else
                %Compare new with old
                oldSize = size(windowOld);
                for l = 1:oldSize(1)
                    
                    [~, index] = min(abs([windowData{:,3}] - [windowOld{l,3}]) + abs([windowData{:,4}] - [windowOld{l,4}]) + abs([windowData{:,5}] - [windowOld{l,5}]));
                    goodIndices(l) = index;
                    
                    if l == 1
                        marker1.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker1.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                    elseif l==2
                        marker2.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker2.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                    
                    elseif l==3
                        marker3.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker3.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                
                    end
                end
            end
            
            %just the good ones
            windowOld = windowData(goodIndices,:);
            windowData = Michi(k,:);
        end
    end
end
%%
marker1.d(~any(marker1.d,2),:) = [];
marker2.d(~any(marker2.d,2),:) = [];
marker3.d(~any(marker3.d,2),:) = [];

marker1.t(~any(marker1.t,2),:) = [];
marker2.t(~any(marker2.t,2),:) = [];
marker3.t(~any(marker3.t,2),:) = [];



[~, coeff] = pca(marker1.d);
data.m1.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.m1.marker1(:,2) = coeff(:,1);

[~, coeff] = pca(marker2.d);
data.m1.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.m1.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.m1.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.m1.marker3(:,2) = coeff(:,1);

clear Michi
%% 

load('.\AufnahmenNeu\Tim.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

markerPoints = size(Tim);

marker1.t = zeros(markerPoints(1), 1);
marker1.d = zeros(markerPoints(1), 3);

marker2.t = zeros(markerPoints(1), 1);
marker2.d = zeros(markerPoints(1), 3);

marker3.t = zeros(markerPoints(1), 1);
marker3.d = zeros(markerPoints(1), 3);


for k = 1:markerPoints(1)
    if (Tim{k,9}==Tim{k,10} && Tim{k,2}==0)
        marker1.t(k) = hex2dec(Tim{k,1}(3:end));
        marker1.d(k,:) = [Tim{k,3},Tim{k,4},Tim{k,5}];
    
    elseif (Tim{k,9}==Tim{k,10} && Tim{k,2}==1)
        marker2.t(k) = hex2dec(Tim{k,1}(3:end));
        marker2.d(k,:) = [Tim{k,3},Tim{k,4},Tim{k,5}];
    
    elseif(Tim{k,9}==Tim{k,10} && Tim{k,2}==2)
        marker3.t(k) = hex2dec(Tim{k,1}(3:end));
        marker3.d(k,:) = [Tim{k,3},Tim{k,4},Tim{k,5}];
    end
end
%%
marker1.d(~any(marker1.d,2),:) = [];
marker2.d(~any(marker2.d,2),:) = [];
marker3.d(~any(marker3.d,2),:) = [];

marker1.t(~any(marker1.t,2),:) = [];
marker2.t(~any(marker2.t,2),:) = [];
marker3.t(~any(marker3.t,2),:) = [];



[~, coeff] = pca(marker1.d);
data.m2.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.m2.marker1(:,2) = coeff(:,1);

[~, coeff] = pca(marker2.d);
data.m2.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.m2.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.m2.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.m2.marker3(:,2) = coeff(:,1);

clear Tim
%% 

clear windowData
MESSFREQUENZ_HZ = 1e6;
load('.\AufnahmenNeu\Stefan.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

markerPoints = size(Stefan);

marker1.t = zeros(markerPoints(1), 1);
marker1.d = zeros(markerPoints(1), 3);

marker2.t = zeros(markerPoints(1), 1);
marker2.d = zeros(markerPoints(1), 3);

marker3.t = zeros(markerPoints(1), 1);
marker3.d = zeros(markerPoints(1), 3);

clear windowOld;
clear windowData;
for k = 1:markerPoints(1)
    
    if (~exist('windowData') )
        windowData = Stefan(k,:);
    else
        windowSize = size(windowData);
        if (windowData{1,1} == Stefan{k,1})
            windowData(windowSize(1)+1,:) = Stefan(k,:);
        else
            if ~exist('windowOld')
                
                for l = 1:windowSize(1)
                    if ( windowData{l,2} == 0)
                        marker1.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker1.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];

                    elseif (  windowData{l,2} == 1 )
                        marker2.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker2.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];

                    elseif(windowData{l,2} == 2)
                        marker3.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker3.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];
                    end
                    
                end
                goodIndices = 1:3;
            else
                %Compare new with old
                oldSize = size(windowOld);
                for l = 1:oldSize(1)
                    
                    [~, index] = min(abs([windowData{:,3}] - [windowOld{l,3}]) + abs([windowData{:,4}] - [windowOld{l,4}]) + abs([windowData{:,5}] - [windowOld{l,5}]));
                    goodIndices(l) = index;
                    
                    if l == 1
                        marker1.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker1.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                    elseif l==2
                        marker2.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker2.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                    
                    elseif l==3
                        marker3.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker3.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                
                    end
                end
            end
            
            %just the good ones
            windowOld = windowData(goodIndices,:);
            windowData = Stefan(k,:);
        end
    end
end
%%
marker1.d(~any(marker1.d,2),:) = [];
marker2.d(~any(marker2.d,2),:) = [];
marker3.d(~any(marker3.d,2),:) = [];

marker1.t(~any(marker1.t,2),:) = [];
marker2.t(~any(marker2.t,2),:) = [];
marker3.t(~any(marker3.t,2),:) = [];



[~, coeff] = pca(marker1.d);
data.m3.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.m3.marker1(:,2) = coeff(:,1);

[~, coeff] = pca(marker2.d);
data.m3.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.m3.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.m3.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.m3.marker3(:,2) = coeff(:,1);

%clear Stefan
%% 
MESSFREQUENZ_HZ = 1e6;
load('.\AufnahmenNeu\StefanReferenz.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

markerPoints = size(StefanReferenz);

marker1.t = zeros(markerPoints(1), 1);
marker1.d = zeros(markerPoints(1), 3);

marker2.t = zeros(markerPoints(1), 1);
marker2.d = zeros(markerPoints(1), 3);

marker3.t = zeros(markerPoints(1), 1);
marker3.d = zeros(markerPoints(1), 3);


clear windowOld;
clear windowData;
for k = 1:markerPoints(1)
    
    if (~exist('windowData') )
        windowData = StefanReferenz(k,:);
    else
        windowSize = size(windowData);
        if (windowData{1,1} == StefanReferenz{k,1})
            windowData(windowSize(1)+1,:) = StefanReferenz(k,:);
        else
            if ~exist('windowOld')
                
                for l = 1:windowSize(1)
                    if ( windowData{l,2} == 0)
                        goodIndices(1) = l;
                        marker1.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker1.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];

                    elseif (  windowData{l,2} == 3 )
                        marker2.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker2.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];
                        goodIndices(2) = l;
                    elseif(windowData{l,2} == 4)
                        marker3.t(k-windowSize(1)+l-1) = hex2dec(windowData{l,1}(3:end));
                        marker3.d(k-windowSize(1)+l-1,:) = [windowData{l,3},windowData{l,4},windowData{l,5}];
                        goodIndices(3) = l;
                    end                    
                end
            else
                %Compare new with old
                oldSize = size(windowOld);
                for l = 1:oldSize(1)
                    
                    [~, index] = min(abs([windowData{:,3}] - [windowOld{l,3}]) + abs([windowData{:,4}] - [windowOld{l,4}]) + abs([windowData{:,5}] - [windowOld{l,5}]));
                    goodIndices(l) = index;
                    
                    if l == 1
                        marker1.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker1.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                    elseif l==2
                        marker2.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker2.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                    
                    elseif l==3
                        marker3.t(k-oldSize(1)+l-1) = hex2dec(windowData{index,1}(3:end));
                        marker3.d(k-oldSize(1)+l-1,:) = [windowData{index,3},windowData{index,4},windowData{index,5}];
                
                    end
                end
            end
            
            %just the good ones
            windowOld = windowData(goodIndices,:);
            windowData = StefanReferenz(k,:);
        end
    end
end
%%
marker1.d(~any(marker1.d,2),:) = [];
marker2.d(~any(marker2.d,2),:) = [];
marker3.d(~any(marker3.d,2),:) = [];

marker1.t(~any(marker1.t,2),:) = [];
marker2.t(~any(marker2.t,2),:) = [];
marker3.t(~any(marker3.t,2),:) = [];



[~, coeff] = pca(marker1.d);
data.eval.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.eval.marker1(:,2) = coeff(:,1);

[~, coeff] = pca(marker2.d);
data.eval.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.eval.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.eval.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.eval.marker3(:,2) = coeff(:,1);

clear StefanReferenz
%% 

save 'data' data