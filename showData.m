load('data.mat');
close all;
%%


subplot(3,1,1);

plot(data.f1.marker1(:,1), data.f1.marker1(:,2));
title('f1');

subplot(3,1,2);
plot(data.f1.marker2(:,1), data.f1.marker2(:,2));

subplot(3,1,3);
plot(data.f1.marker3(:,1), data.f1.marker3(:,2));
%%

figure();
subplot(3,1,1);

plot(data.m1.marker1(:,1), data.m1.marker1(:,2));
title('m1');
subplot(3,1,2);
plot(data.m1.marker2(:,1), data.m1.marker2(:,2));

subplot(3,1,3);
plot(data.m1.marker3(:,1), data.m1.marker3(:,2));

%%
figure(); %%1:18 start
subplot(3,1,1);

plot(data.m2_1.marker1(:,1), data.m2_1.marker1(:,2));
title('m2_1');
subplot(3,1,2);
plot(data.m2_1.marker2(:,1), data.m2_1.marker2(:,2));

subplot(3,1,3);
plot(data.m2_1.marker3(:,1), data.m2_1.marker3(:,2));

%%
figure();
subplot(3,1,1);

plot(data.m2_2.marker1(:,1), data.m2_2.marker1(:,2));
title('m2_2');
subplot(3,1,2);
plot(data.m2_2.marker2(:,1), data.m2_2.marker2(:,2));

subplot(3,1,3);
plot(data.m2_2.marker3(:,1), data.m2_2.marker3(:,2));
%%
figure();
subplot(3,1,1);

plot(data.eval.marker1(:,1), data.eval.marker1(:,2));
title('eval');
subplot(3,1,2);
plot(data.eval.marker2(:,1), data.eval.marker2(:,2));

subplot(3,1,3);
plot(data.eval.marker3(:,1), data.eval.marker3(:,2));


