

MESSFREQUENZ_HZ = 26;
%% 

load('.\Aufnahmen\markers - Hanna.mat')

LED1 = struct;
LED2 = struct;
LED3 = struct;

LED1.t = zeros(length(markersSave), 1);
LED1.d = zeros(length(markersSave), 3);

LED2.t = zeros(length(markersSave), 1);
LED2.d = zeros(length(markersSave), 3);

LED3.t = zeros(length(markersSave), 1);
LED3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    LED1.t(k) = markersSave(k).timestamp;
    LED1.d(k,:) = markersSave(k).markers(1,:);
    
    LED2.t(k) = markersSave(k).timestamp;
    LED2.d(k,:) = markersSave(k).markers(2,:);
    
    LED3.t(k) = markersSave(k).timestamp;
    LED3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(LED1.d);
data.f1.LED1 = (LED1.t - LED1.t(1)) / MESSFREQUENZ_HZ;
data.f1.LED1(:,2) = coeff(:,1);

[~, coeff] = pca(LED2.d);
data.f1.LED2 = (LED2.t - LED2.t(1)) / MESSFREQUENZ_HZ;
data.f1.LED2(:,2) = coeff(:,1);

[~, coeff] = pca(LED3.d);
data.f1.LED3 = (LED3.t - LED3.t(1)) / MESSFREQUENZ_HZ;
data.f1.LED3(:,2) = coeff(:,1);

%% 

load('.\Aufnahmen\markers - Michi.mat')

LED1 = struct;
LED2 = struct;
LED3 = struct;

LED1.t = zeros(length(markersSave), 1);
LED1.d = zeros(length(markersSave), 3);

LED2.t = zeros(length(markersSave), 1);
LED2.d = zeros(length(markersSave), 3);

LED3.t = zeros(length(markersSave), 1);
LED3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    LED1.t(k) = markersSave(k).timestamp;
    LED1.d(k,:) = markersSave(k).markers(1,:);
    
    LED2.t(k) = markersSave(k).timestamp;
    LED2.d(k,:) = markersSave(k).markers(2,:);
    
    LED3.t(k) = markersSave(k).timestamp;
    LED3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(LED1.d);
data.m1.LED1 = (LED1.t - LED1.t(1)) / MESSFREQUENZ_HZ;
data.m1.LED1(:,2) = coeff(:,1);

[~, coeff] = pca(LED2.d);
data.m1.LED2 = (LED2.t - LED2.t(1)) / MESSFREQUENZ_HZ;
data.m1.LED2(:,2) = coeff(:,1);

[~, coeff] = pca(LED3.d);
data.m1.LED3 = (LED3.t - LED3.t(1)) / MESSFREQUENZ_HZ;
data.m1.LED3(:,2) = coeff(:,1);

%% 

load('.\Aufnahmen\markers - Stefan.mat')

LED1 = struct;
LED2 = struct;
LED3 = struct;

LED1.t = zeros(length(markersSave), 1);
LED1.d = zeros(length(markersSave), 3);

LED2.t = zeros(length(markersSave), 1);
LED2.d = zeros(length(markersSave), 3);

LED3.t = zeros(length(markersSave), 1);
LED3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    LED1.t(k) = markersSave(k).timestamp;
    LED1.d(k,:) = markersSave(k).markers(1,:);
    
    LED2.t(k) = markersSave(k).timestamp;
    LED2.d(k,:) = markersSave(k).markers(2,:);
    
    LED3.t(k) = markersSave(k).timestamp;
    LED3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(LED1.d);
data.m2_1.LED1 = (LED1.t - LED1.t(1)) / MESSFREQUENZ_HZ;
data.m2_1.LED1(:,2) = coeff(:,1);

[~, coeff] = pca(LED2.d);
data.m2_1.LED2 = (LED2.t - LED2.t(1)) / MESSFREQUENZ_HZ;
data.m2_1.LED2(:,2) = coeff(:,1);

[~, coeff] = pca(LED3.d);
data.m2_1.LED3 = (LED3.t - LED3.t(1)) / MESSFREQUENZ_HZ;
data.m2_1.LED3(:,2) = coeff(:,1);

%% 

load('.\Aufnahmen\markers_Nase - Stefan.mat')

LED1 = struct;
LED2 = struct;
LED3 = struct;

LED1.t = zeros(length(markersSave), 1);
LED1.d = zeros(length(markersSave), 3);

LED2.t = zeros(length(markersSave), 1);
LED2.d = zeros(length(markersSave), 3);

LED3.t = zeros(length(markersSave), 1);
LED3.d = zeros(length(markersSave), 3);


for k = 1:length(markersSave)
    LED1.t(k) = markersSave(k).timestamp;
    LED1.d(k,:) = markersSave(k).markers(1,:);
    
    LED2.t(k) = markersSave(k).timestamp;
    LED2.d(k,:) = markersSave(k).markers(2,:);
    
    LED3.t(k) = markersSave(k).timestamp;
    LED3.d(k,:) = markersSave(k).markers(3,:);
end

[~, coeff] = pca(LED1.d);
data.m2_2.LED1 = (LED1.t - LED1.t(1)) / MESSFREQUENZ_HZ;
data.m2_2.LED1(:,2) = coeff(:,1);

[~, coeff] = pca(LED2.d);
data.m2_2.LED2 = (LED2.t - LED2.t(1)) / MESSFREQUENZ_HZ;
data.m2_2.LED2(:,2) = coeff(:,1);

[~, coeff] = pca(LED3.d);
data.m2_2.LED3 = (LED3.t - LED3.t(1)) / MESSFREQUENZ_HZ;
data.m2_2.LED3(:,2) = coeff(:,1);

save 'data' data