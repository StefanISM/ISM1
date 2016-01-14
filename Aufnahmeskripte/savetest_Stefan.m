 

t1 = 1:10;
t2 = 11:20;

d1= 10:10:100;
d2=110:10:200;
%% 

t(1).t=t1;
t(1).d=d1;
t(2).t=t2;
t(2).d=d2;
save 'test' t '-v7.3'
%% 
mObj = matfile('test.mat');
mObj.Properties.Writable=true; 
t(1).t=t2;
t(1).d=d2;
t(2).t=t1;
t(2).d=d1;
sizeT = size(mObj, 't');
mObj.t(:,sizeT(2)+1:sizeT(2)+length(t)) = t;

