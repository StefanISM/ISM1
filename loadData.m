

MESSFREQUENZ_HZ = 26;
%% 

load('.\Aufnahmen\markers - Hanna.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

marker1.t = zeros(length(markersSave), 1);
marker1.d = zeros(length(markersSave), 3);

marker2.t = zeros(length(markersSave), 1);
marker2.d = zeros(length(markersSave), 3);

marker3.t = zeros(length(markersSave), 1);
marker3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    marker1.t(k) = markersSave(k).timestamp;
    marker1.d(k,:) = markersSave(k).markers(1,:);
    
    marker2.t(k) = markersSave(k).timestamp;
    marker2.d(k,:) = markersSave(k).markers(2,:);
    
    marker3.t(k) = markersSave(k).timestamp;
    marker3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(marker1.d);
data.f1.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.f1.marker1(:,2) = coeff(:,1);

[~, coeff] = pca(marker2.d);
data.f1.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.f1.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.f1.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.f1.marker3(:,2) = coeff(:,1);

%% 

load('.\Aufnahmen\markers - Michi.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

marker1.t = zeros(length(markersSave), 1);
marker1.d = zeros(length(markersSave), 3);

marker2.t = zeros(length(markersSave), 1);
marker2.d = zeros(length(markersSave), 3);

marker3.t = zeros(length(markersSave), 1);
marker3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    marker1.t(k) = markersSave(k).timestamp;
    marker1.d(k,:) = markersSave(k).markers(1,:);
    
    marker2.t(k) = markersSave(k).timestamp;
    marker2.d(k,:) = markersSave(k).markers(2,:);
    
    marker3.t(k) = markersSave(k).timestamp;
    marker3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(marker1.d);
data.m1.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.m1.marker1(:,2) = coeff(:,1);

[~, coeff] = pca(marker2.d);
data.m1.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.m1.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.m1.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.m1.marker3(:,2) = coeff(:,1);

%% 

load('.\Aufnahmen\markers - Stefan.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

marker1.t = zeros(length(markersSave), 1);
marker1.d = zeros(length(markersSave), 3);

marker2.t = zeros(length(markersSave), 1);
marker2.d = zeros(length(markersSave), 3);

marker3.t = zeros(length(markersSave), 1);
marker3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    marker1.t(k) = markersSave(k).timestamp;
    marker1.d(k,:) = markersSave(k).markers(1,:);
    
    marker2.t(k) = markersSave(k).timestamp;
    marker2.d(k,:) = markersSave(k).markers(2,:);
    
    marker3.t(k) = markersSave(k).timestamp;
    marker3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(marker1.d);
data.m2_1.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.m2_1.marker1(:,2) = -coeff(:,1);

[~, coeff] = pca(marker2.d);
data.m2_1.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.m2_1.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.m2_1.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.m2_1.marker3(:,2) = -coeff(:,1);

%% 

load('.\Aufnahmen\markers_Nase - Stefan.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

marker1.t = zeros(length(markersSave), 1);
marker1.d = zeros(length(markersSave), 3);

marker2.t = zeros(length(markersSave), 1);
marker2.d = zeros(length(markersSave), 3);

marker3.t = zeros(length(markersSave), 1);
marker3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    marker1.t(k) = markersSave(k).timestamp;
    marker1.d(k,:) = markersSave(k).markers(1,:);
    
    marker2.t(k) = markersSave(k).timestamp;
    marker2.d(k,:) = markersSave(k).markers(2,:);
    
    marker3.t(k) = markersSave(k).timestamp;
    marker3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(marker1.d);
data.m2_2.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.m2_2.marker1(:,2) = -coeff(:,1);

[~, coeff] = pca(marker2.d);
data.m2_2.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.m2_2.marker2(:,2) = coeff(:,1);

[~, coeff] = pca(marker3.d);
data.m2_2.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.m2_2.marker3(:,2) = -coeff(:,1);

%% 

load('.\Aufnahmen\markersForSven.mat')

marker1 = struct;
marker2 = struct;
marker3 = struct;

marker1.t = zeros(length(markersSave), 1);
marker1.d = zeros(length(markersSave), 3);

marker2.t = zeros(length(markersSave), 1);
marker2.d = zeros(length(markersSave), 3);

marker3.t = zeros(length(markersSave), 1);
marker3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    marker1.t(k) = markersSave(k).timestamp;
    marker1.d(k,:) = markersSave(k).markers(1,:);
    
    marker2.t(k) = markersSave(k).timestamp;
    marker2.d(k,:) = markersSave(k).markers(2,:);
    
    marker3.t(k) = markersSave(k).timestamp;
    marker3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(marker1.d);
data.eval.marker1 = (marker1.t - marker1.t(1)) / MESSFREQUENZ_HZ;
data.eval.marker1(:,2) = -coeff(:,1);

[~, coeff] = pca(marker2.d);
data.eval.marker2 = (marker2.t - marker2.t(1)) / MESSFREQUENZ_HZ;
data.eval.marker2(:,2) = -coeff(:,1);

[~, coeff] = pca(marker3.d);
data.eval.marker3 = (marker3.t - marker3.t(1)) / MESSFREQUENZ_HZ;
data.eval.marker3(:,2) = coeff(:,1);

%% 

save 'data' data