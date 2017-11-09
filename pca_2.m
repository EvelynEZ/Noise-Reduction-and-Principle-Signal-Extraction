%% X2
X2 = importdata('X2.mat');
X2 = X2(:,1:300);
[m, n] = size(X2);
mn = mean(X2, 2);
X2_sub = X2 - repmat(mn, 1, n);
[U2, S2, V2] = svd(X2_sub);
%% Plot energy

lamda2 = diag(S2).^2;
lamda2 = 100*lamda2/sum(lamda2);
scatter(1:6,lamda2);
title('Percentage of energy in Singular Values for Case 2');
ylabel('Percentage');
xlabel('n');


%% x, y plot
subplot(2, 1, 1);
plot(X2_sub(1,:));
hold on;
plot(X2_sub(3,:));
plot(X2_sub(5,:));
legend('cam1', 'cam2', 'cam3');
title('normalized X positions in Case 2');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X2_sub(2,:));
hold on;
plot(X2_sub(4,:));
plot(X2_sub(6,:));
title('normalized Y positions in Case 2');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

%% pca
j=1;
S_rank2 = S2;
S_rank2(j+1:end,j+1:end) = 0;
X2_new = U2*S_rank2*V2';

subplot(2, 1, 1);
plot(X2_new(1, :));
hold on;
plot(X2_new(3, :));
plot(X2_new(5, :));
title('X positions for Case 2, PCA mode 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X2_new(2, :));
hold on;
plot(X2_new(4, :));
plot(X2_new(6, :));
title('Y positions for Case 2, PCA mode 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

